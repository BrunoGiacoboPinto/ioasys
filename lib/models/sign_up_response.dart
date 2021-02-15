import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sign_up_response.g.dart';

abstract class UserSignUpInfo
    implements Built<UserSignUpInfo, UserSignUpInfoBuilder> {
  UserSignUpInfo._();

  factory UserSignUpInfo([void Function(UserSignUpInfoBuilder) updates]) =
      _$UserSignUpInfo;

  static Serializer<UserSignUpInfo> get serializer =>
      _$userSignUpInfoSerializer;

  @nullable
  double get portfolio_value;

  @nullable
  bool get first_access;

  @nullable
  bool get super_angel;

  @nullable
  int get id;

  @nullable
  String get investor_name;

  @nullable
  String get email;

  @nullable
  double get balance;

  @nullable
  String get photo;

  @nullable
  String get city;

  @nullable
  String get country;

  @nullable
  String get enterprise;

  @nullable
  bool get success;

  factory UserSignUpInfo.fromJson(Map<String, dynamic> json) {
    final data = json['investor'];
    return UserSignUpInfo((b) => b
      ..portfolio_value = data['portfolio_value']
      ..investor_name = data['investor_name']
      ..first_access = data['first_access']
      ..super_angel = data['super_angel']
      ..enterprise = data['enterprise']
      ..balance = data['balance']
      ..country = data['country']
      ..success = data['success']
      ..photo = data['photo']
      ..email = data['email']
      ..city = data['city']
      ..id = data['id']);
  }
}
