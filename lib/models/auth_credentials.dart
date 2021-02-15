import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_credentials.g.dart';

abstract class AuthCredentials
    implements Built<AuthCredentials, AuthCredentialsBuilder> {
  AuthCredentials._();

  factory AuthCredentials([void Function(AuthCredentialsBuilder) updates]) =
      _$AuthCredentials;

  static Serializer<AuthCredentials> get serializer =>
      _$authCredentialsSerializer;

  @nullable
  String get accessToken;

  @nullable
  String get client;

  @nullable
  String get uid;
}
