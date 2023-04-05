import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  const factory UserModel({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  String get fullName => '$firstName $lastName';

  factory UserModel.empty() => const UserModel(
        firstName: '',
        lastName: '',
        email: '',
        password: '',
      );
}
