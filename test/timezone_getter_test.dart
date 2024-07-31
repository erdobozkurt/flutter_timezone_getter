import 'package:test/test.dart';
import 'package:timezone_getter/timezone_getter.dart';

void main() {
  group('TimezoneGetter', () {
    final TimezoneGetter getter = TimezoneGetter();

    setUp(() async {
      await getter.loadTimezones();
    });

    test('Get timezone name from code', () {
      final String timezoneName = DateTime.now().timeZoneName;
      expect(getter.getTimezoneName(timezoneName), isNotNull);
      expect(getter.getTimezoneName('-3'), 'Atlantic Standard Time');
      expect(getter.getTimezoneName('9'), 'Japan Standard Time');
      expect(getter.getTimezoneName('XYZ'), 'Unknown timezone');
    });
  });
}
