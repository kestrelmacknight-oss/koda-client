// lib/features/server/calendar_screen.dart
//
// Server calendar channel — month view with event creation,
// role-locked via channel_allowed_roles, subscribe to notifications.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../core/api.dart';
import '../../core/permissions.dart';
import '../../core/providers.dart';
import '../../core/theme.dart';
import '../../core/time_utils.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets.dart';
import '../visp/visp_event_dialog.dart';

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
  // Ticket price / stage-linking is a marketplace action, same gate as
  // digital goods and Printful -- see lib/core/permissions.dart.
  bool _canManageMarketplace = false;
  List<Map<String, dynamic>> _stageChannels = [];

  @override
  void initState() {
    super.initState();
    _loadEvents();
    _loadPermissionAndStageChannels();
  }

  Future<void> _loadPermissionAndStageChannels() async {
    final server = ref.read(selectedServerProvider);
    final user = ref.read(authProvider).user;
    final canManage = await hasServerPermission(server, 'manage_marketplace',
        currentUserId: user?.id, isKodaAdmin: user?.isAdmin ?? false);
    final channels = server != null
        ? await KodaApi.instance.getChannels(server['id'] as String)
        : <Map<String, dynamic>>[];
    if (!mounted) return;
    setState(() {
      _canManageMarketplace = canManage;
      _stageChannels = channels.where((c) => c['type'] == 'stage').toList();
    });
  }

  // Occurrences are expanded server-side (see koda-server's
  // Koda.Events.list_events/2) within this window -- a "weekly"/"daily"/
  // "monthly" event now genuinely recurs on the calendar instead of only
  // ever showing on the date it was created. Requested per focused month
  // (with a little slack for the grid's leading/trailing days from
  // adjacent months) rather than once for everything, so navigating far
  // into the future/past of a long-running recurring event still works.
  Future<void> _loadEvents() async {
    setState(() => _loading = true);
    final from = DateTime(_focusedMonth.year, _focusedMonth.month - 1, 21);
    final to = DateTime(_focusedMonth.year, _focusedMonth.month + 2, 10);
    final events = await KodaApi.instance.getEvents(
        widget.channel['id'] as String, from: from, to: to);
    if (!mounted) return;
    setState(() { _events = events; _loading = false; });
  }

  void _changeMonth(int delta) {
    setState(() => _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month + delta));
    _loadEvents();
  }

  List<Map<String, dynamic>> _eventsForDay(DateTime day) {
    return _events.where((e) {
      try {
        final start = parseServerTimestamp(e['start_at'] as String);
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
    final t = AppLocalizations.of(context);
    return Column(children: [
      // Header
      Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: KodaColors.border))),
        child: Row(children: [
          Icon(Icons.calendar_month_outlined, size: 16, color: KodaColors.text3),
          const SizedBox(width: 6),
          Text(widget.channel['name'] as String? ?? t.calendarFallbackTitle,
              style: TextStyle(
                  color: KodaColors.text1, fontWeight: FontWeight.w600)),
          const Spacer(),
          IconButton(
            icon: Icon(Icons.auto_awesome, color: KodaColors.koda, size: 20),
            tooltip: t.calendarAskVispTooltip,
            onPressed: () => showVispEventDialog(
              context,
              channelId: widget.channel['id'] as String,
              onApplied: (_) => _loadEvents(),
            ),
          ),
          IconButton(
            icon: Icon(Icons.add, color: KodaColors.koda, size: 20),
            tooltip: t.calendarCreateEventTooltip,
            onPressed: () => _showEventDialog(),
          ),
        ]),
      ),

      Expanded(
        child: _loading
            ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
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
                  decoration: BoxDecoration(
                    border: Border(left: BorderSide(color: KodaColors.border))),
                  child: _buildEventPanel(),
                ),
              ]),
      ),
    ]);
  }

  Widget _buildMonthHeader() {
    final t = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(children: [
        IconButton(
          icon: Icon(Icons.chevron_left, color: KodaColors.text2),
          tooltip: t.calendarPreviousMonthTooltip,
          onPressed: () => _changeMonth(-1),
        ),
        Expanded(
          child: Text(
            DateFormat('MMMM yyyy').format(_focusedMonth),
            textAlign: TextAlign.center,
            style: TextStyle(color: KodaColors.text1,
                fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        IconButton(
          icon: Icon(Icons.chevron_right, color: KodaColors.text2),
          tooltip: t.calendarNextMonthTooltip,
          onPressed: () => _changeMonth(1),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _focusedMonth = DateTime.now();
              _selectedDay = DateTime.now();
            });
            _loadEvents();
          },
          child: Text(t.calendarTodayButton, style: TextStyle(color: KodaColors.koda)),
        ),
      ]),
    );
  }

  Widget _buildWeekdayLabels() {
    final t = AppLocalizations.of(context);
    final days = [
      t.calendarWeekdaySun, t.calendarWeekdayMon, t.calendarWeekdayTue,
      t.calendarWeekdayWed, t.calendarWeekdayThu, t.calendarWeekdayFri, t.calendarWeekdaySat,
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: days.map((d) => Expanded(
          child: Center(
            child: Text(d,
                style: TextStyle(color: KodaColors.text3,
                    fontSize: 11, fontWeight: FontWeight.w600)),
          ),
        )).toList(),
      ),
    );
  }

  Widget _buildMonthGrid() {
    final t = AppLocalizations.of(context);
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

        return KodaTappable(
          selected: isSelected,
          semanticLabel: '${DateFormat('MMMM d').format(day)}'
              '${isToday ? t.calendarTodaySuffix : ""}'
              '${dayEvents.isNotEmpty ? t.calendarEventCountSuffix(dayEvents.length) : ""}',
          borderRadius: BorderRadius.circular(8),
          onTap: () => setState(() => _selectedDay = day),
          child: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: isSelected
                  ? KodaColors.koda.withValues(alpha: 0.2)
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
    final t = AppLocalizations.of(context);
    final events = _eventsForSelectedDay();
    final label = _selectedDay != null
        ? DateFormat('EEEE, MMMM d').format(_selectedDay!)
        : t.calendarSelectADay;

    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(12),
        child: Text(label,
            style: TextStyle(color: KodaColors.text1,
                fontWeight: FontWeight.w600, fontSize: 13)),
      ),
      Divider(color: KodaColors.border, height: 1),
      if (events.isEmpty)
        Expanded(
          child: Center(child: Text(t.calendarNoEvents,
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

  // Keys are the raw values koda-server stores on an event's `recurrence`
  // field -- display labels are localized separately since a translated
  // string can't double as the value sent back to the API.
  Map<String, String> _recurrenceLabels(AppLocalizations t) => {
    'daily': t.calendarRecurrenceDaily,
    'weekly': t.calendarRecurrenceWeekly,
    'monthly': t.calendarRecurrenceMonthly,
  };

  bool _canManageEvent(Map<String, dynamic> event) {
    final user = ref.read(authProvider).user;
    if (user == null) return false;
    return event['created_by'] == user.id || _canManageMarketplace;
  }

  Widget _buildEventCard(Map<String, dynamic> event) {
    final t = AppLocalizations.of(context);
    final start = parseServerTimestamp(event['start_at'] as String);
    final end = event['end_at'] != null
        ? parseServerTimestamp(event['end_at'] as String)
        : null;
    final color = Color(int.parse(
        (event['color'] as String? ?? '#2DD4A0').replaceFirst('#', '0xFF')));
    final subscribed = event['subscribed'] == true;
    final priceCents = event['price_cents'] as int? ?? 0;
    final hasTicket = event['has_ticket'] == true;
    final canManage = _canManageEvent(event);

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
                  style: TextStyle(color: KodaColors.text1,
                      fontWeight: FontWeight.w600, fontSize: 13)),
            ),
            IconButton(
              icon: Icon(
                subscribed ? Icons.notifications_active : Icons.notifications_outlined,
                color: subscribed ? KodaColors.koda : KodaColors.text3,
                size: 16,
              ),
              tooltip: subscribed ? t.calendarUnsubscribeTooltip : t.calendarSubscribeTooltip,
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
            if (canManage) ...[
              const SizedBox(width: 6),
              IconButton(
                icon: Icon(Icons.edit_outlined, color: KodaColors.text3, size: 16),
                tooltip: t.commonEdit,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () => _showEventDialog(existing: event),
              ),
              const SizedBox(width: 6),
              IconButton(
                icon: Icon(Icons.delete_outline, color: KodaColors.text3, size: 16),
                tooltip: t.commonDelete,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () => _confirmDeleteEvent(event),
              ),
            ],
          ]),
          const SizedBox(height: 4),
          Row(children: [
            Icon(Icons.access_time, size: 12, color: KodaColors.text3),
            const SizedBox(width: 4),
            Text(
              end != null
                  ? '${DateFormat('h:mm a').format(start)} – ${DateFormat('h:mm a').format(end)}'
                  : DateFormat('h:mm a').format(start),
              style: TextStyle(color: KodaColors.text3, fontSize: 11),
            ),
          ]),
          if (event['location'] != null && (event['location'] as String).isNotEmpty) ...[
            const SizedBox(height: 2),
            Row(children: [
              Icon(Icons.location_on_outlined, size: 12, color: KodaColors.text3),
              const SizedBox(width: 4),
              Text(event['location'] as String,
                  style: TextStyle(color: KodaColors.text3, fontSize: 11)),
            ]),
          ],
          if (event['description'] != null && (event['description'] as String).isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(event['description'] as String,
                style: TextStyle(color: KodaColors.text2, fontSize: 12)),
          ],
          if ((event['recurrence'] != null && event['recurrence'] != 'none') ||
              priceCents > 0) ...[
            const SizedBox(height: 4),
            Wrap(spacing: 6, runSpacing: 4, children: [
              if (event['recurrence'] != null && event['recurrence'] != 'none')
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: KodaColors.elevated,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    t.calendarRepeatsLabel(_recurrenceLabels(t)[event['recurrence']] ??
                        event['recurrence'] as String),
                    style: TextStyle(color: KodaColors.text3, fontSize: 10),
                  ),
                ),
              if (priceCents > 0)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: KodaColors.koda.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(hasTicket ? Icons.confirmation_num : Icons.confirmation_num_outlined,
                        size: 10, color: KodaColors.koda),
                    const SizedBox(width: 3),
                    Text(
                      hasTicket
                          ? t.calendarTicketOwned
                          : t.calendarTicketPrice('\$${(priceCents / 100).toStringAsFixed(2)}'),
                      style: TextStyle(color: KodaColors.koda,
                          fontSize: 10, fontWeight: FontWeight.w600),
                    ),
                  ]),
                ),
            ]),
          ],
        ]),
      ),
    );
  }

  Future<void> _confirmDeleteEvent(Map<String, dynamic> event) async {
    final t = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.calendarDeleteEventTitle, style: TextStyle(color: KodaColors.text1)),
        content: Text(t.calendarDeleteEventConfirm(event['title'] as String? ?? ''),
            style: TextStyle(color: KodaColors.text2)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false),
              child: Text(t.commonCancel)),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(t.commonDelete, style: TextStyle(color: KodaColors.accent)),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await KodaApi.instance.deleteEvent(event['id'] as String);
      if (mounted) _loadEvents();
    }
  }

  Future<void> _showEventDialog({Map<String, dynamic>? existing}) async {
    final t = AppLocalizations.of(context);
    final isEdit = existing != null;
    final titleCtrl = TextEditingController(text: existing?['title'] as String? ?? '');
    final descCtrl = TextEditingController(text: existing?['description'] as String? ?? '');
    final locCtrl = TextEditingController(text: existing?['location'] as String? ?? '');
    final priceCtrl = TextEditingController(
        text: existing != null && (existing['price_cents'] as int? ?? 0) > 0
            ? ((existing['price_cents'] as int) / 100).toStringAsFixed(2)
            : '');
    DateTime startAt = existing != null
        ? parseServerTimestamp(existing['start_at'] as String)
        : DateTime.now().add(const Duration(hours: 1));
    DateTime? endAt = existing?['end_at'] != null
        ? parseServerTimestamp(existing!['end_at'] as String)
        : null;
    String recurrence = existing?['recurrence'] as String? ?? 'none';
    String color = existing?['color'] as String? ?? '#2DD4A0';
    String? stageChannelId = existing?['stage_channel_id'] as String?;

    await showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text(isEdit ? t.calendarEditEventTitle : t.calendarCreateEventTitle,
              style: TextStyle(color: KodaColors.text1)),
          content: SizedBox(
            width: 400,
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                KodaTextField(controller: titleCtrl, hintText: t.calendarEventTitleHint, autofocus: true),
                const SizedBox(height: 10),
                KodaTextField(controller: descCtrl, hintText: t.calendarDescriptionHint),
                const SizedBox(height: 10),
                KodaTextField(controller: locCtrl, hintText: t.calendarLocationHint),
                const SizedBox(height: 12),

                // Start time
                Text(t.calendarStartLabel(DateTime.now().timeZoneName),
                  style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                const SizedBox(height: 4),
                KodaTappable(
                  semanticLabel: t.calendarStartDateTimeSemanticLabel(
                      DateFormat('MMM d, yyyy h:mm a').format(startAt)),
                  borderRadius: BorderRadius.circular(8),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: ctx,
                      initialDate: startAt,
                      firstDate: DateTime.now().subtract(const Duration(days: 365)),
                      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
                    );
                    if (date == null) return;
                    if (!ctx.mounted) return;
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
                        style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                  ),
                ),
                const SizedBox(height: 10),

                // End time
                Text(t.calendarEndOptionalLabel(DateTime.now().timeZoneName),
                  style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                const SizedBox(height: 4),
                KodaTappable(
                  semanticLabel: t.calendarEndDateTimeSemanticLabel(endAt != null
                      ? DateFormat('MMM d, yyyy h:mm a').format(endAt!)
                      : t.calendarNotSetLabel),
                  borderRadius: BorderRadius.circular(8),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: ctx,
                      initialDate: endAt ?? startAt.add(const Duration(hours: 1)),
                      firstDate: startAt,
                      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
                    );
                    if (date == null) return;
                    if (!ctx.mounted) return;
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
                          : t.calendarTapToSetEndTime,
                      style: TextStyle(
                          color: endAt != null ? KodaColors.text1 : KodaColors.text3,
                          fontSize: 13),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Recurrence
                Text(t.calendarRecurrenceLabel, style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                const SizedBox(height: 4),
                DropdownButton<String>(
                  value: recurrence,
                  dropdownColor: KodaColors.card,
                  style: TextStyle(color: KodaColors.text1, fontSize: 13),
                  onChanged: (v) => setDialogState(() => recurrence = v!),
                  items: [
                    DropdownMenuItem(value: 'none', child: Text(t.calendarRecurrenceNone)),
                    DropdownMenuItem(value: 'daily', child: Text(t.calendarRecurrenceDaily)),
                    DropdownMenuItem(value: 'weekly', child: Text(t.calendarRecurrenceWeekly)),
                    DropdownMenuItem(value: 'monthly', child: Text(t.calendarRecurrenceMonthly)),
                  ],
                ),
                const SizedBox(height: 12),

                // Color
                Text(t.calendarColorLabel, style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                const SizedBox(height: 6),
                Wrap(spacing: 8, children: [
                  '#2DD4A0', '#7F77DD', '#E05C5C', '#F59E0B',
                  '#3B82F6', '#EC4899', '#10B981',
                ].map((c) {
                  final col = Color(int.parse(c.replaceFirst('#', '0xFF')));
                  return KodaTappable(
                    selected: color == c,
                    semanticLabel: t.calendarColorSwatchLabel(c),
                    borderRadius: BorderRadius.circular(999),
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

                // Ticket price + stage link -- only server members who can
                // manage the marketplace may turn an event into a paid
                // ticket, same gate as digital goods / Printful.
                if (_canManageMarketplace) ...[
                  const SizedBox(height: 12),
                  Text(t.calendarTicketPriceLabel,
                      style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                  const SizedBox(height: 4),
                  KodaTextField(
                    controller: priceCtrl,
                    hintText: '0.00',
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                  if (_stageChannels.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Text(t.calendarLinkStageChannelLabel,
                        style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                    const SizedBox(height: 4),
                    DropdownButton<String?>(
                      value: stageChannelId,
                      dropdownColor: KodaColors.card,
                      isExpanded: true,
                      style: TextStyle(color: KodaColors.text1, fontSize: 13),
                      onChanged: (v) => setDialogState(() => stageChannelId = v),
                      items: [
                        DropdownMenuItem<String?>(
                            value: null, child: Text(t.commonNone)),
                        ..._stageChannels.map((c) => DropdownMenuItem<String?>(
                              value: c['id'] as String,
                              child: Text(c['name'] as String? ?? t.calendarStageChannelFallback),
                            )),
                      ],
                    ),
                  ],
                ],
              ]),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx),
                child: Text(t.commonCancel)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: KodaColors.koda,
                  foregroundColor: Colors.black),
              onPressed: () async {
                if (titleCtrl.text.trim().isEmpty) return;
                Navigator.pop(ctx);
                final priceCents = _canManageMarketplace
                    ? ((double.tryParse(priceCtrl.text.trim()) ?? 0) * 100).round()
                    : (existing?['price_cents'] as int? ?? 0);
                final data = {
                  'title': titleCtrl.text.trim(),
                  'description': descCtrl.text.trim(),
                  'location': locCtrl.text.trim(),
                  'start_at': startAt.toUtc().toIso8601String(),
                  'end_at': endAt?.toUtc().toIso8601String(),
                  'recurrence': recurrence,
                  'color': color,
                  if (_canManageMarketplace) 'price_cents': priceCents,
                  if (_canManageMarketplace) 'stage_channel_id': stageChannelId,
                };
                if (isEdit) {
                  final ok = await KodaApi.instance.updateEvent(
                      existing['id'] as String, data);
                  if (ok && mounted) _loadEvents();
                } else {
                  final event = await KodaApi.instance.createEvent(
                      widget.channel['id'] as String, data);
                  if (event != null && mounted) _loadEvents();
                }
              },
              child: Text(isEdit ? t.commonSave : t.commonCreate),
            ),
          ],
        ),
      ),
    );
  }
}