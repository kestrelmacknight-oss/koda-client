// lib/core/time_utils.dart
//
// Server timestamps are always UTC -- every timestamp field is Ecto's
// :utc_datetime_usec, serialized via Elixir's DateTime.to_iso8601/1,
// which always appends "Z". But Dart's own DateTime.parse defaults to
// *local* time for any ISO string missing an explicit zone/offset
// marker -- the opposite assumption. That mismatch is a silent
// footgun: a stray naive timestamp from anywhere in the stack (a typo'd
// field, a future NaiveDateTime slip server-side, a hand-built string)
// would be misread as already-local and never converted, showing the
// wrong clock time with no error and nothing to catch it.
//
// Route every server-timestamp parse through here instead of a bare
// DateTime.parse(...).toLocal() so that assumption is explicit and
// enforced in one place, not implicitly correct-by-convention across a
// dozen call sites.

final RegExp _hasZoneMarker = RegExp(r'(Z|[+-]\d{2}:?\d{2})$');

/// Parses a server-supplied ISO8601 timestamp, forcing UTC
/// interpretation if the string carries no zone/offset marker, then
/// converts to the device's local time zone for display.
DateTime parseServerTimestamp(String raw) {
  final normalized = _hasZoneMarker.hasMatch(raw) ? raw : '${raw}Z';
  return DateTime.parse(normalized).toLocal();
}
