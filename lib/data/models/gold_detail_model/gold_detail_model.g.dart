// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gold_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GoldDetailModel _$$_GoldDetailModelFromJson(Map<String, dynamic> json) =>
    _$_GoldDetailModel(
      timestamp:
          const TimestampToDateConverter().fromJson(json['timestamp'] as int),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$_GoldDetailModelToJson(_$_GoldDetailModel instance) =>
    <String, dynamic>{
      'timestamp': const TimestampToDateConverter().toJson(instance.timestamp),
      'price': instance.price,
    };
