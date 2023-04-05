import 'package:dio/dio.dart';
import 'package:remote_coach/constants/app_string.dart';
import 'package:remote_coach/data/api/api.dart';

class DioHelper {
  static DioHelper? _instance = DioHelper._internal();

  DioHelper._internal();

  factory DioHelper() {
    _instance ??= DioHelper._internal();
    return _instance!;
  }

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Api.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-access-token': AppString.apiKey,
      },
    ),
  )..interceptors.addAll(
      [
        LogInterceptor(
          request: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
        )
      ],
    );
  Dio get dio => _dio;
}
