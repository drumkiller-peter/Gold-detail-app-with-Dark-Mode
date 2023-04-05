import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remote_coach/constants/app_string.dart';
import 'package:remote_coach/data/models/gold_detail_model/gold_detail_model.dart';
import 'package:remote_coach/data/repository/dashboard_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this._dashboardRepository) : super(DashboardInitial()) {
    on<DashboardDataRequested>((event, emit) async {
      emit(DashboardLoadInProgress());
      try {
        timer = _makePeriodicCall(const Duration(seconds: 60), (Timer timer) {
          add(DashboardStreamDataRequested());
        }, fireNow: true);
      } catch (e) {
        emit(DashboardFailure(message: AppString.genericError));
      }
    });

    on<DashboardStreamDataRequested>(_fetchStreamData);
  }

  Future<void> _fetchStreamData(
      DashboardStreamDataRequested event, Emitter<DashboardState> emit) async {
    emit(DashboardInitial());
    final response = await _dashboardRepository.fetchGoldValue();
    response.fold((l) {
      resetTimer();
      emit(DashboardFailure(message: l));
    }, (r) {
      goldDetailList.add(r);
      emit(DashboardSuccess(goldDetailList: goldDetailList, tick: timer.tick));
    });
  }

  Timer _makePeriodicCall(
    Duration duration,
    void Function(Timer timer) callback, {
    bool fireNow = false,
  }) {
    var timer = Timer.periodic(duration, callback);
    if (fireNow) {
      callback(timer);
    }
    return timer;
  }

  void resetTimer() {
    timer.cancel();
  }

  @override
  Future<void> close() {
    timer.cancel();
    return super.close();
  }

  final DashboardRepository _dashboardRepository;
  List<GoldDetailModel> goldDetailList = <GoldDetailModel>[];
  late Timer timer;
}
