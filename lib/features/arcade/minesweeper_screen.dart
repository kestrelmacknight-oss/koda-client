// lib/features/arcade/minesweeper_screen.dart
//
// Classic Minesweeper, entirely local/single-player. On a win, the
// score is posted to this server's "arcade_minesweeper" leaderboard
// (Koda.Leaderboards.submit_arcade_score/4) -- a loss submits nothing,
// since this is a high-score board, not a participation log.

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';

enum _Difficulty { beginner, intermediate, expert }

class _DifficultySpec {
  final int rows, cols, mines;
  // Faster/harder clears score higher: a flat per-difficulty base plus
  // a time bonus that decays to a floor, scaled by the multiplier --
  // simple on purpose, just enough to reward skill without a leaderboard
  // readable only as "who left it running the longest."
  final int baseScore, timeBonusCap, multiplier;
  const _DifficultySpec(this.rows, this.cols, this.mines, this.baseScore, this.timeBonusCap, this.multiplier);
}

const _specs = {
  _Difficulty.beginner:     _DifficultySpec(9, 9, 10, 100, 400, 1),
  _Difficulty.intermediate: _DifficultySpec(16, 16, 40, 400, 800, 3),
  _Difficulty.expert:       _DifficultySpec(16, 30, 99, 1000, 2000, 6),
};

class MinesweeperScreen extends StatefulWidget {
  final String serverId;
  const MinesweeperScreen({super.key, required this.serverId});

  @override
  State<MinesweeperScreen> createState() => _MinesweeperScreenState();
}

class _MinesweeperScreenState extends State<MinesweeperScreen> {
  _Difficulty _difficulty = _Difficulty.beginner;
  late List<List<bool>> _mines;
  late List<List<int>> _adjacent;
  late List<List<bool>> _revealed;
  late List<List<bool>> _flagged;
  bool _started = false;
  bool _gameOver = false;
  int _elapsedSeconds = 0;
  Timer? _timer;

  _DifficultySpec get _spec => _specs[_difficulty]!;

  @override
  void initState() {
    super.initState();
    _newGame();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _newGame() {
    _timer?.cancel();
    final spec = _spec;
    _mines = List.generate(spec.rows, (_) => List.filled(spec.cols, false));
    _adjacent = List.generate(spec.rows, (_) => List.filled(spec.cols, 0));
    _revealed = List.generate(spec.rows, (_) => List.filled(spec.cols, false));
    _flagged = List.generate(spec.rows, (_) => List.filled(spec.cols, false));
    _started = false;
    _gameOver = false;
    _elapsedSeconds = 0;
    setState(() {});
  }

  void _placeMines(int safeRow, int safeCol) {
    final spec = _spec;
    final rand = Random();
    var placed = 0;
    while (placed < spec.mines) {
      final r = rand.nextInt(spec.rows);
      final c = rand.nextInt(spec.cols);
      // Never mine the first-clicked cell or its immediate neighbors --
      // nobody should lose on their very first move.
      if ((r - safeRow).abs() <= 1 && (c - safeCol).abs() <= 1) continue;
      if (_mines[r][c]) continue;
      _mines[r][c] = true;
      placed++;
    }
    for (var r = 0; r < spec.rows; r++) {
      for (var c = 0; c < spec.cols; c++) {
        if (_mines[r][c]) continue;
        var count = 0;
        for (final nr in [r - 1, r, r + 1]) {
          for (final nc in [c - 1, c, c + 1]) {
            if (nr == r && nc == c) continue;
            if (nr >= 0 && nr < spec.rows && nc >= 0 && nc < spec.cols && _mines[nr][nc]) count++;
          }
        }
        _adjacent[r][c] = count;
      }
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted || _gameOver) return;
      setState(() => _elapsedSeconds++);
    });
  }

  void _reveal(int r, int c) {
    if (_gameOver || _flagged[r][c] || _revealed[r][c]) return;
    if (!_started) {
      _started = true;
      _placeMines(r, c);
      _startTimer();
    }
    setState(() {
      if (_mines[r][c]) {
        _revealed[r][c] = true;
        _endGame(won: false);
        return;
      }
      _floodReveal(r, c);
      if (_checkWin()) _endGame(won: true);
    });
  }

  void _floodReveal(int r, int c) {
    final spec = _spec;
    if (r < 0 || r >= spec.rows || c < 0 || c >= spec.cols) return;
    if (_revealed[r][c] || _flagged[r][c]) return;
    _revealed[r][c] = true;
    if (_adjacent[r][c] != 0) return;
    for (final nr in [r - 1, r, r + 1]) {
      for (final nc in [c - 1, c, c + 1]) {
        if (nr == r && nc == c) continue;
        _floodReveal(nr, nc);
      }
    }
  }

  bool _checkWin() {
    final spec = _spec;
    for (var r = 0; r < spec.rows; r++) {
      for (var c = 0; c < spec.cols; c++) {
        if (!_mines[r][c] && !_revealed[r][c]) return false;
      }
    }
    return true;
  }

  void _toggleFlag(int r, int c) {
    if (_gameOver || _revealed[r][c]) return;
    setState(() => _flagged[r][c] = !_flagged[r][c]);
  }

  int get _score {
    final spec = _spec;
    final timeBonus = max(0, spec.timeBonusCap - _elapsedSeconds * (spec.timeBonusCap ~/ 60).clamp(1, 1000));
    return (spec.baseScore + timeBonus) * spec.multiplier;
  }

  Future<void> _endGame({required bool won}) async {
    _timer?.cancel();
    _gameOver = true;
    if (won) {
      // Reveal flags for any unflagged mines too, so the board reads as
      // "complete" rather than looking like it stopped mid-way.
      final spec = _spec;
      for (var r = 0; r < spec.rows; r++) {
        for (var c = 0; c < spec.cols; c++) {
          if (_mines[r][c]) _flagged[r][c] = true;
        }
      }
      final score = _score;
      await KodaApi.instance.submitArcadeScore(widget.serverId, 'minesweeper', score);
    }
    if (!mounted) return;
    final t = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(won ? t.arcadeMinesweeperWinTitle : t.arcadeMinesweeperLoseTitle,
            style: TextStyle(color: KodaColors.text1)),
        content: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(won ? t.arcadeMinesweeperWinBody(_score) : t.arcadeMinesweeperLoseBody,
              style: TextStyle(color: KodaColors.text3)),
          if (won) ...[
            const SizedBox(height: 6),
            Text(t.arcadeScoreSubmittedNote, style: TextStyle(color: KodaColors.koda, fontSize: 12)),
          ],
        ]),
        actions: [
          TextButton(onPressed: () { Navigator.pop(context); _newGame(); }, child: Text(t.arcadeNewGameButton)),
          TextButton(onPressed: () => Navigator.pop(context), child: Text(t.commonClose)),
        ],
      ),
    );
  }

  int get _minesLeft {
    var flaggedCount = 0;
    for (final row in _flagged) { for (final f in row) { if (f) flaggedCount++; } }
    return _spec.mines - flaggedCount;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final spec = _spec;
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.arcadeMinesweeperTitle, style: TextStyle(color: KodaColors.text1, fontSize: 16)),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: KodaColors.text3),
            tooltip: t.arcadeNewGameButton,
            onPressed: _newGame,
          ),
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(children: [
            SegmentedButton<_Difficulty>(
              segments: [
                ButtonSegment(value: _Difficulty.beginner, label: Text(t.arcadeDifficultyBeginner)),
                ButtonSegment(value: _Difficulty.intermediate, label: Text(t.arcadeDifficultyIntermediate)),
                ButtonSegment(value: _Difficulty.expert, label: Text(t.arcadeDifficultyExpert)),
              ],
              selected: {_difficulty},
              onSelectionChanged: (s) { setState(() => _difficulty = s.first); _newGame(); },
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(t.arcadeMinesLeftLabel(_minesLeft), style: TextStyle(color: KodaColors.text2, fontSize: 13)),
            Text(t.arcadeTimeLabel(_elapsedSeconds), style: TextStyle(color: KodaColors.text2, fontSize: 13)),
          ]),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Center(
            child: InteractiveViewer(
              minScale: 0.5,
              maxScale: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(spec.rows, (r) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(spec.cols, (c) => _buildCell(r, c)),
                  )),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildCell(int r, int c) {
    final revealed = _revealed[r][c];
    final flagged = _flagged[r][c];
    final isMine = _mines[r][c];
    final count = _adjacent[r][c];

    Widget child = const SizedBox.shrink();
    Color bg = KodaColors.card;
    if (flagged) {
      child = const Icon(Icons.flag, size: 14, color: Colors.redAccent);
    } else if (revealed) {
      bg = KodaColors.bg2;
      if (isMine) {
        child = const Icon(Icons.brightness_1, size: 12, color: Colors.black);
      } else if (count > 0) {
        child = Text('$count', style: TextStyle(
            color: _countColor(count), fontSize: 12, fontWeight: FontWeight.w700));
      }
    }

    return GestureDetector(
      onTap: () => _reveal(r, c),
      onLongPress: () => _toggleFlag(r, c),
      onSecondaryTap: () => _toggleFlag(r, c),
      child: Container(
        width: 22, height: 22,
        margin: const EdgeInsets.all(0.5),
        decoration: BoxDecoration(
          color: bg,
          border: Border.all(color: KodaColors.border, width: 0.5),
          borderRadius: BorderRadius.circular(2),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }

  Color _countColor(int n) {
    const colors = [
      Colors.blue, Colors.green, Colors.red, Colors.purple,
      Colors.orange, Colors.teal, Colors.black, Colors.grey,
    ];
    return colors[(n - 1).clamp(0, colors.length - 1)];
  }
}
