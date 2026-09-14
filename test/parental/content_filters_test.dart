// test/parental/content_filters_test.dart
//
// effectiveFilterSetting (content_filters_screen.dart) picks one
// effective Hide/Warn/Show for a channel that may carry several content
// labels at once, each with its own per-label preference. The rule is
// "most restrictive wins" -- a single Hide-rated label should hide the
// whole channel even if every other label on it is set to Show.

import 'package:flutter_test/flutter_test.dart';
import 'package:koda/features/settings/content_filters_screen.dart';

void main() {
  group('effectiveFilterSetting', () {
    test('an unlabeled channel is always shown, regardless of prefs', () {
      expect(effectiveFilterSetting([], {'adult': 'hide'}), 'show');
    });

    test('a single label uses that label\'s own preference', () {
      expect(effectiveFilterSetting(['adult'], {'adult': 'hide'}), 'hide');
      expect(effectiveFilterSetting(['adult'], {'adult': 'warn'}), 'warn');
      expect(effectiveFilterSetting(['adult'], {'adult': 'show'}), 'show');
    });

    test('an unset label defaults to warn', () {
      expect(effectiveFilterSetting(['graphic'], {}), 'warn');
    });

    test('the most restrictive setting across multiple labels wins: hide beats warn and show', () {
      final prefs = {'adult': 'show', 'suggestive': 'warn', 'graphic': 'hide'};
      expect(effectiveFilterSetting(['adult', 'suggestive', 'graphic'], prefs), 'hide');
    });

    test('warn beats show when no label is hidden', () {
      final prefs = {'adult': 'show', 'nudity': 'warn'};
      expect(effectiveFilterSetting(['adult', 'nudity'], prefs), 'warn');
    });

    test('all labels set to show results in show', () {
      final prefs = {'adult': 'show', 'suggestive': 'show'};
      expect(effectiveFilterSetting(['adult', 'suggestive'], prefs), 'show');
    });
  });
}
