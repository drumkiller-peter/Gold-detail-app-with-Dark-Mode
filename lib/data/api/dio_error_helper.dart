import 'package:dio/dio.dart';
import 'package:remote_coach/constants/app_string.dart';

class DioErrorHelper {
  DioErrorHelper._();

  static String extractErrorMessage(DioError error) {
    final data = error.response?.data;
    if (data != null) {
      if (data is String) return data;
      if (data.containsKey("error")) {
        return data['error'];
      }
    }
    return AppString.genericError;
  }
}
