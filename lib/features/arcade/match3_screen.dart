// lib/features/arcade/match3_screen.dart
//
// A small Bejeweled-style match-3: tap a gem, tap an adjacent gem to
// swap. A swap that doesn't create a match of 3+ reverts for free (no
// move spent). Matches clear, gems fall, new ones refill from the top,
// and any resulting chain match scores again at a higher multiplier.
// Fixed move budget per session; final score posts to this server's
// "arcade_match3" leaderboard on Koda.Leaderboards, entirely local/
// single-player otherwise.

import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';

const _gridSize = 8;
const _gemTypes = 6;
const _startingMoves = 30;

const _gemIcons = [
  Icons.favorite, Icons.water_drop, Icons.eco,
  Icons.star, Icons.whatshot, Icons.ac_unit,
];
const _gemColors = [
  Colors.redAccent, Colors.blueAccent, Colors.greenAccent,
  Colors.amber, Colors.deepOrangeAccent, Colors.cyanAccent,
];

class Match3Screen extends StatefulWidget {
  final String serverId;
  const Match3Screen({super.key, required this.serverId});

  @override
  State<Match3Screen> createState() => _Match3ScreenState();
}

class _Match3ScreenState extends State<Match3Screen> {
  late List<List<int>> _grid;
  int? _selRow, _selCol;
  int _score = 0;
  int _movesLeft = _startingMoves;
  bool _busy = false;
  bool _ended = false;
  final _rand = Random();

  @override
  void initState() {
    super.initState();
    _newGame();
  }

  void _newGame() {
    _grid = List.generate(_gridSize, (r) => List.generate(_gridSize, (c) => _pickNonMatching(r, c)));
    _selRow = null;
    _selCol = null;
    _score = 0;
    _movesLeft = _startingMoves;
    _busy = false;
    _ended = false;
    setState(() {});
  }

  /// Fills a cell during board generation while avoiding an immediate
  /// 3-in-a-row with the two cells already placed to its left/above --
  /// so the starting board never opens with a free match sitting there.
  int _pickNonMatching(int r, int c) {
    while (true) {
      final g = _rand.nextInt(_gemTypes);
      final leftPair = c >= 2 && _grid[r][c - 1] == g && _grid[r][c - 2] == g;
      final upPair = r >= 2 && _grid[r - 1][c] == g && _grid[r - 2][c] == g;
      if (!leftPair && !upPair) return g;
    }
  }

  bool _adjacent(int r1, int c1, int r2, int c2) =>
      (r1 == r2 && (c1 - c2).abs() == 1) || (c1 == c2 && (r1 - r2).abs() == 1);

  void _onTapCell(int r, int c) {
    if (_busy || _ended) return;
    if (_selRow == null) {
      setState(() { _selRow = r; _selCol = c; });
      return;
    }
    if (_selRow == r && _selCol == c) {
      setState(() { _selRow = null; _selCol = null; });
      return;
    }
    if (!_adjacent(_selRow!, _selCol!, r, c)) {
      setState(() { _selRow = r; _selCol = c; });
      return;
    }
    _attemptSwap(_selRow!, _selCol!, r, c);
  }

  Future<void> _attemptSwap(int r1, int c1, int r2, int c2) async {
    setState(() { _selRow = null; _selCol = null; _busy = true; });
    _swap(r1, c1, r2, c2);
    final matches = _findMatches();
    if (matches.isEmpty) {
      // No match -- revert, no move spent.
      _swap(r1, c1, r2, c2);
      setState(() => _busy = false);
      return;
    }
    _movesLeft--;
    await _resolveCascades();
    if (!mounted) return;
    if (_movesLeft <= 0) {
      await _endGame();
    } else {
      setState(() => _busy = false);
    }
  }

  void _swap(int r1, int c1, int r2, int c2) {
    final tmp = _grid[r1][c1];
    _grid[r1][c1] = _grid[r2][c2];
    _grid[r2][c2] = tmp;
  }

  Set<Point<int>> _findMatches() {
    final matched = <Point<int>>{};
    for (var r = 0; r < _gridSize; r++) {
      var runStart = 0;
      for (var c = 1; c <= _gridSize; c++) {
        final broke = c == _gridSize || _grid[r][c] != _grid[r][runStart];
        if (broke) {
          if (c - runStart >= 3) {
            for (var k = runStart; k < c; k++) { matched.add(Point(r, k)); }
          }
          runStart = c;
        }
      }
    }
    for (var c = 0; c < _gridSize; c++) {
      var runStart = 0;
      for (var r = 1; r <= _gridSize; r++) {
        final broke = r == _gridSize || _grid[r][c] != _grid[runStart][c];
        if (broke) {
          if (r - runStart >= 3) {
            for (var k = runStart; k < r; k++) { matched.add(Point(k, c)); }
          }
          runStart = r;
        }
      }
    }
    return matched;
  }

  int _scoreForMatchSize(int size) {
    if (size <= 3) return 30;
    if (size == 4) return 50;
    if (size == 5) return 80;
    return 80 + 20 * (size - 5);
  }

  Future<void> _resolveCascades() async {
    var cascadeMultiplier = 1;
    while (true) {
      final matches = _findMatches();
      if (matches.isEmpty) break;

      // Score per contiguous run rather than per cell -- group matched
      // cells back into their runs so a 5-in-a-row scores once as a
      // 5-match, not as five separate 3-matches.
      final runSizesByCell = <Point<int>, int>{};
      for (var r = 0; r < _gridSize; r++) {
        var runStart = 0;
        for (var c = 1; c <= _gridSize; c++) {
          final broke = c == _gridSize || _grid[r][c] != _grid[r][runStart];
          if (broke) {
            if (c - runStart >= 3) {
              for (var k = runStart; k < c; k++) {
                runSizesByCell[Point(r, k)] = max(runSizesByCell[Point(r, k)] ?? 0, c - runStart);
              }
            }
            runStart = c;
          }
        }
      }
      for (var c = 0; c < _gridSize; c++) {
        var runStart = 0;
        for (var r = 1; r <= _gridSize; r++) {
          final broke = r == _gridSize || _grid[r][c] != _grid[runStart][c];
          if (broke) {
            if (r - runStart >= 3) {
              for (var k = runStart; k < r; k++) {
                runSizesByCell[Point(k, c)] = max(runSizesByCell[Point(k, c)] ?? 0, r - runStart);
              }
            }
            runStart = r;
          }
        }
      }

      final gained = runSizesByCell.values.fold(0, (sum, size) => sum + _scoreForMatchSize(size));
      _score += gained * cascadeMultiplier;
      cascadeMultiplier++;

      for (final p in matches) {
        _grid[p.x][p.y] = -1;
      }
      _collapseAndRefill();
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 180));
    }
  }

  void _collapseAndRefill() {
    for (var c = 0; c < _gridSize; c++) {
      final remaining = <int>[];
      for (var r = 0; r < _gridSize; r++) {
        if (_grid[r][c] != -1) remaining.add(_grid[r][c]);
      }
      final missing = _gridSize - remaining.length;
      final refilled = List.generate(missing, (_) => _rand.nextInt(_gemTypes)) + remaining;
      for (var r = 0; r < _gridSize; r++) {
        _grid[r][c] = refilled[r];
      }
    }
  }

  Future<void> _endGame() async {
    _ended = true;
    _busy = false;
    await KodaApi.instance.submitArcadeScore(widget.serverId, 'match3', _score);
    if (!mounted) return;
    setState(() {});
    final t = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.arcadeMatch3GameOverTitle, style: TextStyle(color: KodaColors.text1)),
        content: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(t.arcadeMatch3GameOverBody(_score), style: TextStyle(color: KodaColors.text3)),
          const SizedBox(height: 6),
          Text(t.arcadeScoreSubmittedNote, style: TextStyle(color: KodaColors.koda, fontSize: 12)),
        ]),
        actions: [
          TextButton(onPressed: () { Navigator.pop(context); _newGame(); }, child: Text(t.arcadeNewGameButton)),
          TextButton(onPressed: () => Navigator.pop(context), child: Text(t.commonClose)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.arcadeMatch3Title, style: TextStyle(color: KodaColors.text1, fontSize: 16)),
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(t.arcadeMatch3ScoreLabel(_score), style: TextStyle(color: KodaColors.text1, fontSize: 15, fontWeight: FontWeight.w700)),
            Text(t.arcadeMatch3MovesLeftLabel(_movesLeft), style: TextStyle(color: KodaColors.text2, fontSize: 13)),
          ]),
        ),
        Expanded(
          child: Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _gridSize, crossAxisSpacing: 2, mainAxisSpacing: 2),
                  itemCount: _gridSize * _gridSize,
                  itemBuilder: (_, i) => _buildCell(i ~/ _gridSize, i % _gridSize),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildCell(int r, int c) {
    final gem = _grid[r][c];
    final selected = _selRow == r && _selCol == c;
    return GestureDetector(
      onTap: () => _onTapCell(r, c),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: KodaColors.card,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: selected ? KodaColors.koda : KodaColors.border, width: selected ? 2 : 1),
        ),
        alignment: Alignment.center,
        child: gem >= 0
            ? Icon(_gemIcons[gem], color: _gemColors[gem], size: 20)
            : const SizedBox.shrink(),
      ),
    );
  }
}
