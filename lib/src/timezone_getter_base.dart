import 'dart:convert';
import 'dart:io';

class Timezone {
  final String value;
  final String abbr;
  final double offset;
  final bool isdst;
  final String text;
  final List<String> utc;

  Timezone({
    required this.value,
    required this.abbr,
    required this.offset,
    required this.isdst,
    required this.text,
    required this.utc,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) {
    return Timezone(
      value: json['value'],
      abbr: json['abbr'],
      offset: (json['offset'] as num).toDouble(),
      isdst: json['isdst'],
      text: json['text'],
      utc: List<String>.from(json['utc']),
    );
  }
}

class TimezoneGetter {
  List<Timezone> _timezones = [];

  Future<void> loadTimezones() async {
    final file = File('lib/data/timezones.json');
    final String response = await file.readAsString();
    final List<dynamic> data = jsonDecode(response);
    _timezones = data.map((json) => Timezone.fromJson(json)).toList();
  }

  String getTimezoneName(String code) {
    final timezone = _timezones.firstWhere(
      (tz) => tz.offset == double.tryParse(code),
      orElse: () => Timezone(
        value: 'Unknown timezone',
        abbr: code,
        offset: 0,
        isdst: false,
        text: '',
        utc: [],
      ),
    );
    return timezone.value;
  }

  String getTimezoneAbbr(String code) {
    final timezone = _timezones.firstWhere(
      (tz) => tz.offset == double.tryParse(code),
      orElse: () => Timezone(
        value: 'Unknown timezone',
        abbr: code,
        offset: 0,
        isdst: false,
        text: '',
        utc: [],
      ),
    );
    return timezone.abbr;
  }

  double getTimezoneOffset(String code) {
    final timezone = _timezones.firstWhere(
      (tz) => tz.offset == double.tryParse(code),
      orElse: () => Timezone(
        value: 'Unknown timezone',
        abbr: code,
        offset: 0,
        isdst: false,
        text: '',
        utc: [],
      ),
    );
    return timezone.offset;
  }

  bool getTimezoneIsdst(String code) {
    final timezone = _timezones.firstWhere(
      (tz) => tz.offset == double.tryParse(code),
      orElse: () => Timezone(
        value: 'Unknown timezone',
        abbr: code,
        offset: 0,
        isdst: false,
        text: '',
        utc: [],
      ),
    );
    return timezone.isdst;
  }

  String getTimezoneText(String code) {
    final timezone = _timezones.firstWhere(
      (tz) => tz.offset == double.tryParse(code),
      orElse: () => Timezone(
        value: 'Unknown timezone',
        abbr: code,
        offset: 0,
        isdst: false,
        text: '',
        utc: [],
      ),
    );
    return timezone.text;
  }

  List<String> getTimezoneUtc(String code) {
    final timezone = _timezones.firstWhere(
      (tz) => tz.offset == double.tryParse(code),
      orElse: () => Timezone(
        value: 'Unknown timezone',
        abbr: code,
        offset: 0,
        isdst: false,
        text: '',
        utc: [],
      ),
    );
    return timezone.utc;
  }
}
