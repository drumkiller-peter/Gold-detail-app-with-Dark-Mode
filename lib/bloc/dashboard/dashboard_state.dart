// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dashboard_bloc.dart';

@immutable
class DashboardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoadInProgress extends DashboardState {}

class DashboardFailure extends DashboardState {
  final String message;
  DashboardFailure({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

class DashboardSuccess extends DashboardState {
  final List<GoldDetailModel> goldDetailList;
  final int tick;
  DashboardSuccess({
    required this.goldDetailList,
    required this.tick,
  });

  @override
  List<Object?> get props => [goldDetailList, tick];
}
