// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gold_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GoldDetailModel _$GoldDetailModelFromJson(Map<String, dynamic> json) {
  return _GoldDetailModel.fromJson(json);
}

/// @nodoc
mixin _$GoldDetailModel {
  @TimestampToDateConverter()
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoldDetailModelCopyWith<GoldDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoldDetailModelCopyWith<$Res> {
  factory $GoldDetailModelCopyWith(
          GoldDetailModel value, $Res Function(GoldDetailModel) then) =
      _$GoldDetailModelCopyWithImpl<$Res, GoldDetailModel>;
  @useResult
  $Res call({@TimestampToDateConverter() DateTime timestamp, double price});
}

/// @nodoc
class _$GoldDetailModelCopyWithImpl<$Res, $Val extends GoldDetailModel>
    implements $GoldDetailModelCopyWith<$Res> {
  _$GoldDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GoldDetailModelCopyWith<$Res>
    implements $GoldDetailModelCopyWith<$Res> {
  factory _$$_GoldDetailModelCopyWith(
          _$_GoldDetailModel value, $Res Function(_$_GoldDetailModel) then) =
      __$$_GoldDetailModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@TimestampToDateConverter() DateTime timestamp, double price});
}

/// @nodoc
class __$$_GoldDetailModelCopyWithImpl<$Res>
    extends _$GoldDetailModelCopyWithImpl<$Res, _$_GoldDetailModel>
    implements _$$_GoldDetailModelCopyWith<$Res> {
  __$$_GoldDetailModelCopyWithImpl(
      _$_GoldDetailModel _value, $Res Function(_$_GoldDetailModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? price = null,
  }) {
    return _then(_$_GoldDetailModel(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GoldDetailModel implements _GoldDetailModel {
  const _$_GoldDetailModel(
      {@TimestampToDateConverter() required this.timestamp,
      required this.price});

  factory _$_GoldDetailModel.fromJson(Map<String, dynamic> json) =>
      _$$_GoldDetailModelFromJson(json);

  @override
  @TimestampToDateConverter()
  final DateTime timestamp;
  @override
  final double price;

  @override
  String toString() {
    return 'GoldDetailModel(timestamp: $timestamp, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoldDetailModel &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GoldDetailModelCopyWith<_$_GoldDetailModel> get copyWith =>
      __$$_GoldDetailModelCopyWithImpl<_$_GoldDetailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GoldDetailModelToJson(
      this,
    );
  }
}

abstract class _GoldDetailModel implements GoldDetailModel {
  const factory _GoldDetailModel(
      {@TimestampToDateConverter() required final DateTime timestamp,
      required final double price}) = _$_GoldDetailModel;

  factory _GoldDetailModel.fromJson(Map<String, dynamic> json) =
      _$_GoldDetailModel.fromJson;

  @override
  @TimestampToDateConverter()
  DateTime get timestamp;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$_GoldDetailModelCopyWith<_$_GoldDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}
