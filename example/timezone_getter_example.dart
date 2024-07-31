import 'package:timezone_getter/timezone_getter.dart';

void main() async {
  // Load timezones
  final TimezoneGetter timezoneGetter = TimezoneGetter();
  await timezoneGetter.loadTimezones();

  // Get timezone abbreviation for example: '+03'
  final String timezoneCode = DateTime.now().timeZoneName;

  // Get timezone values
  final String timezoneName = timezoneGetter.getTimezoneName(timezoneCode);
  final String timezoneAbbr = timezoneGetter.getTimezoneAbbr(timezoneCode);
  final double timezoneOffset = timezoneGetter.getTimezoneOffset(timezoneCode);
  final List<String> timezoneUtc = timezoneGetter.getTimezoneUtc(timezoneCode);

  // Print timezone values
  print('Timezone name: $timezoneName');
  print('Timezone abbreviation: $timezoneAbbr');
  print('Timezone offset: $timezoneOffset');
  print('Timezone UTC: $timezoneUtc');
}
