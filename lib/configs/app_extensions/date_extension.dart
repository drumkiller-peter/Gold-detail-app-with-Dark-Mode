import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String getTime() {
    return DateFormat('hh:mm').format(this);
  }

  // Dec 10, 2022
  String getFullDateTime() {
    return DateFormat('dd-MM-yyyy hh:mm:ss aaa').format(this);
  }
}
