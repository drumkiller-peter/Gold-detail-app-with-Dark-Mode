import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remote_coach/configs/app_type_converter/timestamp_to_date_converter.dart';

part 'gold_detail_model.freezed.dart';
part 'gold_detail_model.g.dart';

@freezed
class GoldDetailModel with _$GoldDetailModel {
  const factory GoldDetailModel({
    @TimestampToDateConverter() required DateTime timestamp,
    required double price,
  }) = _GoldDetailModel;

  factory GoldDetailModel.fromJson(Map<String, dynamic> json) =>
      _$GoldDetailModelFromJson(json);
}
