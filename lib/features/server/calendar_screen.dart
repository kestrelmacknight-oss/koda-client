// lib/features/server/calendar_screen.dart
//
// Server calendar channel — month view with event creation,
// role-locked via channel_allowed_roles, subscribe to notifications.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../core/api.dart';
import '../../core/providers.dart';
import '../../core/theme.dart';
import '../../shared/widgets.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic> channel;
  const CalendarScreen({super.key, required this.channel});
  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  DateTime _focusedMonth = DateTime.now();
  DateTime? _selectedDay;
  List<Map<String, dynamic>> _events = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    setState(() => _loading = true);
    final events = await KodaApi.instance.getEvents(widget.channel['id'] as String);
    if (!mounted) return;
    setState(() { _events = events; _loading = false; });
  }

  List<Map<String, dynamic>> _eventsForDay(DateTime day) {
    return _events.where((e) {
      try {
        final start = DateTime.parse(e['start_at'] as String).toLocal();
        return start.year == day.year &&
               start.month == day.month &&
               start.day == day.day;
      } catch (_) { return false; }
    }).toList();
  }

  List<Map<String, dynamic>> _eventsForSelectedDay() {
    if (_selectedDay == null) return [];
    return _eventsForDay(_selectedDay!);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider).user;
    return Column(children: [
      // Header
      Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: KodaColors.border))),
        child: Row(children: [
          const Icon(Icons.calendar_month_outlined, size: 16, color: KodaColors.text3),
          const SizedBox(width: 6),
          Text(widget.channel['name'] as String? ?? 'Calendar',
              style: const TextStyle(
                  color: KodaColors.text1, fontWeight: FontWeight.w600)),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.add, color: KodaColors.koda, size: 20),
            tooltip: 'Create Event',
            onPressed: () => _showCreateEventDialog(),
          ),
        ]),
      ),

      Expanded(
        child: _loading
            ? const Center(child: CircularProgressIndicator(color: KodaColors.koda))
            : Row(children: [
                // Calendar
                Expanded(
                  flex: 3,
                  child: Column(children: [
                    _buildMonthHeader(),
                    _buildWeekdayLabels(),
                    Expanded(child: _buildMonthGrid()),
                  ]),
                ),

                // Event list for selected day
                Container(
                  width: 280,
                  decoration: const BoxDecoration(
                    border: Border(left: BorderSide(color: KodaColors.border))),
                  child: _buildEventPanel(),
                ),
              ]),
      ),
    ]);
  }

  Widget _buildMonthHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(children: [
        IconButton(
          icon: const Icon(Icons.chevron_left, color: KodaColors.text2),
          onPressed: () => setState(() =>
              _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month - 1)),
        ),
        Expanded(
          child: Text(
            DateFormat('MMMM yyyy').format(_focusedMonth),
            textAlign: TextAlign.center,
            style: const TextStyle(color: KodaColors.text1,
                fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right, color: KodaColors.text2),
          onPressed: () => setState(() =>
              _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month + 1)),
        ),
        TextButton(
          onPressed: () => setState(() {
            _focusedMonth = DateTime.now();
            _selectedDay = DateTime.now();
          }),
          child: const Text('Today', style: TextStyle(color: KodaColors.koda)),
        ),
      ]),
    );
  }

  Widget _buildWeekdayLabels() {
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: days.map((d) => Expanded(
          child: Center(
            child: Text(d,
                style: const TextStyle(color: KodaColors.text3,
                    fontSize: 11, fontWeight: FontWeight.w600)),
          ),
        )).toList(),
      ),
    );
  }

  Widget _buildMonthGrid() {
    final firstDay = DateTime(_focusedMonth.year, _focusedMonth.month, 1);
    final lastDay = DateTime(_focusedMonth.year, _focusedMonth.month + 1, 0);
    final startOffset = firstDay.weekday % 7;
    final totalDays = startOffset + lastDay.day;
    final totalWeeks = (totalDays / 7).ceil();
    final today = DateTime.now();

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1.2,
      ),
      itemCount: totalWeeks * 7,
      itemBuilder: (_, idx) {
        final dayNum = idx - startOffset + 1;
        if (dayNum < 1 || dayNum > lastDay.day) {
          return const SizedBox.shrink();
        }
        final day = DateTime(_focusedMonth.year, _focusedMonth.month, dayNum);
        final isToday = day.year == today.year &&
            day.month == today.month && day.day == today.day;
        final isSelected = _selectedDay != null &&
            day.year == _selectedDay!.year &&
            day.month == _selectedDay!.month &&
            day.day == _selectedDay!.day;
        final dayEvents = _eventsForDay(day);

        return GestureDetector(
          onTap: () => setState(() => _selectedDay = day),
          child: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: isSelected
                  ? KodaColors.koda.withOpacity(0.2)
                  : isToday
                      ? KodaColors.elevated
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: isToday
                  ? Border.all(color: KodaColors.koda, width: 1)
                  : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$dayNum',
                    style: TextStyle(
                        color: isSelected || isToday
                            ? KodaColors.koda
                            : KodaColors.text2,
                        fontSize: 13,
                        fontWeight: isToday ? FontWeight.w700 : FontWeight.normal)),
                if (dayEvents.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: dayEvents.take(3).map((e) => Container(
                      width: 5, height: 5,
                      margin: const EdgeInsets.only(top: 2, left: 1),
                      decoration: BoxDecoration(
                        color: Color(int.parse(
                            (e['color'] as String? ?? '#2DD4A0')
                                .replaceFirst('#', '0xFF'))),
                        shape: BoxShape.circle,
                      ),
                    )).toList(),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEventPanel() {
    final events = _eventsForSelectedDay();
    final label = _selectedDay != null
        ? DateFormat('EEEE, MMMM d').format(_selectedDay!)
        : 'Select a day';

    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(12),
        child: Text(label,
            style: const TextStyle(color: KodaColors.text1,
                fontWeight: FontWeight.w600, fontSize: 13)),
      ),
      const Divider(color: KodaColors.border, height: 1),
      if (events.isEmpty)
        const Expanded(
          child: Center(child: Text('No events',
              style: TextStyle(color: KodaColors.text3, fontSize: 13))),
        )
      else
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: events.length,
            itemBuilder: (_, i) => _buildEventCard(events[i]),
          ),
        ),
    ]);
  }

  Widget _buildEventCard(Map<String, dynamic> event) {
    final start = DateTime.parse(event['start_at'] as String).toLocal();
    final end = event['end_at'] != null
        ? DateTime.parse(event['end_at'] as String).toLocal()
        : null;
    final color = Color(int.parse(
        (event['color'] as String? ?? '#2DD4A0').replaceFirst('#', '0xFF')));
    final subscribed = event['subscribed'] == true;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(10),
        border: Border(left: BorderSide(color: color, width: 3)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Expanded(
              child: Text(event['title'] as String? ?? '',
                  style: const TextStyle(color: KodaColors.text1,
                      fontWeight: FontWeight.w600, fontSize: 13)),
            ),
            IconButton(
              icon: Icon(
                subscribed ? Icons.notifications_active : Icons.notifications_outlined,
                color: subscribed ? KodaColors.koda : KodaColors.text3,
                size: 16,
              ),
              tooltip: subscribed ? 'Unsubscribe' : 'Subscribe',
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () async {
                if (subscribed) {
                  await KodaApi.instance.unsubscribeFromEvent(event['id'] as String);
                } else {
                  await KodaApi.instance.subscribeToEvent(event['id'] as String);
                }
                _loadEvents();
              },
            ),
          ]),
          const SizedBox(height: 4),
          Row(children: [
            const Icon(Icons.access_time, size: 12, color: KodaColors.text3),
            const SizedBox(width: 4),
            Text(
              end != null
                  ? '${DateFormat('h:mm a').format(start)} – ${DateFormat('h:mm a').format(end)}'
                  : DateFormat('h:mm a').format(start),
              style: const TextStyle(color: KodaColors.text3, fontSize: 11),
            ),
          ]),
          if (event['location'] != null && (event['location'] as String).isNotEmpty) ...[
            const SizedBox(height: 2),
            Row(children: [
              const Icon(Icons.location_on_outlined, size: 12, color: KodaColors.text3),
              const SizedBox(width: 4),
              Text(event['location'] as String,
                  style: const TextStyle(color: KodaColors.text3, fontSize: 11)),
            ]),
          ],
          if (event['description'] != null && (event['description'] as String).isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(event['description'] as String,
                style: const TextStyle(color: KodaColors.text2, fontSize: 12)),
          ],
          if (event['recurrence'] != null && event['recurrence'] != 'none') ...[
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: KodaColors.elevated,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Repeats ${event['recurrence']}',
                style: const TextStyle(color: KodaColors.text3, fontSize: 10),
              ),
            ),
          ],
        ]),
      ),
    );
  }

  Future<void> _showCreateEventDialog() async {
    final titleCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final locCtrl = TextEditingController();
    DateTime startAt = DateTime.now().add(const Duration(hours: 1));
    DateTime? endAt;
    String recurrence = 'none';
    String color = '#2DD4A0';

    await showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: const Text('Create Event',
              style: TextStyle(color: KodaColors.text1)),
          content: SizedBox(
            width: 400,
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                KodaTextField(controller: titleCtrl, hintText: 'Event title'),
                const SizedBox(height: 10),
                KodaTextField(controller: descCtrl, hintText: 'Description (optional)'),
                const SizedBox(height: 10),
                KodaTextField(controller: locCtrl, hintText: 'Location (optional)'),
                const SizedBox(height: 12),

                // Start time
                Text('Start (${DateTime.now().timeZoneName})', 
                  style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: ctx,
                      initialDate: startAt,
                      firstDate: DateTime.now().subtract(const Duration(days: 365)),
                      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
                    );
                    if (date == null) return;
                    final time = await showTimePicker(
                        context: ctx, initialTime: TimeOfDay.fromDateTime(startAt));
                    if (time == null) return;
                    setDialogState(() => startAt = DateTime(
                        date.year, date.month, date.day, time.hour, time.minute));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: KodaColors.elevated,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(DateFormat('MMM d, yyyy h:mm a').format(startAt),
                        style: const TextStyle(color: KodaColors.text1, fontSize: 13)),
                  ),
                ),
                const SizedBox(height: 10),

                // End time
                Text('End — optional (${DateTime.now().timeZoneName})', 
                  style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: ctx,
                      initialDate: endAt ?? startAt.add(const Duration(hours: 1)),
                      firstDate: startAt,
                      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
                    );
                    if (date == null) return;
                    final time = await showTimePicker(
                        context: ctx,
                        initialTime: TimeOfDay.fromDateTime(
                            endAt ?? startAt.add(const Duration(hours: 1))));
                    if (time == null) return;
                    setDialogState(() => endAt = DateTime(
                        date.year, date.month, date.day, time.hour, time.minute));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: KodaColors.elevated,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      endAt != null
                          ? DateFormat('MMM d, yyyy h:mm a').format(endAt!)
                          : 'Tap to set end time',
                      style: TextStyle(
                          color: endAt != null ? KodaColors.text1 : KodaColors.text3,
                          fontSize: 13),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Recurrence
                const Text('Recurrence', style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                const SizedBox(height: 4),
                DropdownButton<String>(
                  value: recurrence,
                  dropdownColor: KodaColors.card,
                  style: const TextStyle(color: KodaColors.text1, fontSize: 13),
                  onChanged: (v) => setDialogState(() => recurrence = v!),
                  items: const [
                    DropdownMenuItem(value: 'none', child: Text('Does not repeat')),
                    DropdownMenuItem(value: 'daily', child: Text('Daily')),
                    DropdownMenuItem(value: 'weekly', child: Text('Weekly')),
                    DropdownMenuItem(value: 'monthly', child: Text('Monthly')),
                  ],
                ),
                const SizedBox(height: 12),

                // Color
                const Text('Color', style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                const SizedBox(height: 6),
                Wrap(spacing: 8, children: [
                  '#2DD4A0', '#7F77DD', '#E05C5C', '#F59E0B',
                  '#3B82F6', '#EC4899', '#10B981',
                ].map((c) {
                  final col = Color(int.parse(c.replaceFirst('#', '0xFF')));
                  return GestureDetector(
                    onTap: () => setDialogState(() => color = c),
                    child: Container(
                      width: 24, height: 24,
                      decoration: BoxDecoration(
                        color: col,
                        shape: BoxShape.circle,
                        border: color == c
                            ? Border.all(color: Colors.white, width: 2)
                            : null,
                      ),
                    ),
                  );
                }).toList()),
              ]),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx),
                child: const Text('Cancel')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: KodaColors.koda,
                  foregroundColor: Colors.black),
              onPressed: () async {
                if (titleCtrl.text.trim().isEmpty) return;
                Navigator.pop(ctx);
                final event = await KodaApi.instance.createEvent(
                  widget.channel['id'] as String,
                  {
                    'title': titleCtrl.text.trim(),
                    'description': descCtrl.text.trim(),
                    'location': locCtrl.text.trim(),
                    'start_at': startAt.toUtc().toIso8601String(),
                    'end_at': endAt?.toUtc().toIso8601String(),
                    'recurrence': recurrence,
                    'color': color,
                  },
                );
                if (event != null && mounted) _loadEvents();
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}