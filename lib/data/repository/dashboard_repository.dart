// This repository is for handling all the request related to dashboard.

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:remote_coach/configs/dependency_injection/dependency_injection.dart';
import 'package:remote_coach/constants/app_string.dart';
import 'package:remote_coach/data/api/dio_error_helper.dart';
import 'package:remote_coach/data/models/gold_detail_model/gold_detail_model.dart';

class DashboardRepository {
  final Dio _dio = getIt.get<Dio>();

  Future<Either<String, GoldDetailModel>> fetchGoldValue() async {
    try {
      var response = await _dio.get("XAU/USD");

      return right(GoldDetailModel.fromJson(response.data));
    } on SocketException {
      return left(AppString.noInternet);
    } on DioError catch (e) {
      return left(e.type == DioErrorType.unknown
          ? AppString.noInternet
          : DioErrorHelper.extractErrorMessage(e));
    }
  }
}
