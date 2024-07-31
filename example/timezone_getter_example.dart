import 'package:timezone_getter/timezone_getter.dart';

void main() async {
  // Load timezones
  final TimezoneGetter tz = TimezoneGetter();
  await tz.loadTimezones();

  // Get timezone abbreviation for example: '+03'
  final String timezoneCode = DateTime.now().timeZoneName;

  // Get timezone values
  final String timezoneName = tz.getTimezoneName(timezoneCode);
  final String timezoneAbbr = tz.getTimezoneAbbr(timezoneCode);
  final double timezoneOffset = tz.getTimezoneOffset(timezoneCode);
  final List<String> timezoneUtc = tz.getTimezoneUtc(timezoneCode);

  // Print timezone values
  print('Timezone name: $timezoneName');
  print('Timezone abbreviation: $timezoneAbbr');
  print('Timezone offset: $timezoneOffset');
  print('Timezone UTC: $timezoneUtc');
}
