import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sign_up_error.g.dart';

abstract class UserSignUpError
    implements Built<UserSignUpError, UserSignUpErrorBuilder> {
  UserSignUpError._();

  factory UserSignUpError([void Function(UserSignUpErrorBuilder) updates]) =
      _$UserSignUpError;

  static Serializer<UserSignUpError> get serializer =>
      _$userSignUpErrorSerializer;

  @nullable
  bool get success;

  @nullable
  List<String> get errors;

  factory UserSignUpError.fromJson(Map<String, dynamic> json) =>
      UserSignUpError((b) => b
        ..success = json['success']
        ..errors =
            (json['errors'] as List<dynamic>).map((e) => e as String).toList());
}
