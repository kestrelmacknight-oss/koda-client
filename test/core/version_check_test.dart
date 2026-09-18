// test/core/version_check_test.dart
//
// compareVersions is the one part of lib/core/version_check.dart worth
// real tests -- a naive string comparison gets "0.9.0" vs "0.10.0"
// backwards (lexicographic '1' < '9' even though 10 > 9 numerically),
// which would either nag someone already on the latest build forever
// or, worse, silently never nag someone who's actually out of date.

import 'package:flutter_test/flutter_test.dart';
import 'package:koda/core/version_check.dart';

void main() {
  group('compareVersions', () {
    test('equal versions compare as 0', () {
      expect(compareVersions('0.34.0', '0.34.0'), 0);
    });

    test('a lower patch version is less than a higher one', () {
      expect(compareVersions('0.34.0', '0.34.1'), lessThan(0));
      expect(compareVersions('0.34.1', '0.34.0'), greaterThan(0));
    });

    test('a lower minor version is less, even with a higher patch', () {
      expect(compareVersions('0.33.9', '0.34.0'), lessThan(0));
    });

    test('a lower major version is less, even with higher minor/patch', () {
      expect(compareVersions('0.99.99', '1.0.0'), lessThan(0));
    });

    test('double-digit segments compare numerically, not lexicographically', () {
      // The classic string-compare bug: '9' > '1' as characters, but
      // 10 > 9 as numbers.
      expect(compareVersions('0.9.0', '0.10.0'), lessThan(0));
      expect(compareVersions('0.10.0', '0.9.0'), greaterThan(0));
      expect(compareVersions('1.9.9', '1.10.0'), lessThan(0));
    });

    test('differing segment counts are handled without throwing', () {
      expect(compareVersions('1.0', '1.0.0'), 0);
      expect(compareVersions('1.0', '1.0.1'), lessThan(0));
      expect(compareVersions('1.2.0.1', '1.2.0'), greaterThan(0));
    });

    test('non-numeric segments degrade to 0 rather than throwing', () {
      expect(() => compareVersions('1.0.0-beta', '1.0.0'), returnsNormally);
    });
  });

  group('VersionCheckResult gating (via compareVersions, matching VersionCheck.check\'s logic)', () {
    test('a server version equal to the local build means no update', () {
      expect(compareVersions('0.34.0', '0.34.0') <= 0, isTrue);
    });

    test('a server version older than the local build means no update either', () {
      // Shouldn't normally happen, but a rollback or a stale response
      // must not tell an up-to-date (or newer, e.g. a dev build) user
      // they're behind.
      expect(compareVersions('0.33.0', '0.34.0') <= 0, isTrue);
    });

    test('a server version newer than the local build means an update is available', () {
      expect(compareVersions('0.35.0', '0.34.0') <= 0, isFalse);
    });
  });
}
