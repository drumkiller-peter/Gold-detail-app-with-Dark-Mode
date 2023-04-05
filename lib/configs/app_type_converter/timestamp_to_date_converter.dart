import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampToDateConverter extends JsonConverter<DateTime, int> {
  const TimestampToDateConverter();
  @override
  DateTime fromJson(int json) {
    return DateTime.fromMillisecondsSinceEpoch(json * 1000);
  }

  @override
  int toJson(DateTime object) {
    return object.millisecondsSinceEpoch ~/ 1000;
  }
}
