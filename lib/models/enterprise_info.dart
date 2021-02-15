import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'enterprise_type.dart';

part 'enterprise_info.g.dart';

abstract class EnterpriseInfo
    implements Built<EnterpriseInfo, EnterpriseInfoBuilder> {
  EnterpriseInfo._();

  factory EnterpriseInfo([void Function(EnterpriseInfoBuilder) updates]) =
      _$EnterpriseInfo;

  static Serializer<EnterpriseInfo> get serializer =>
      _$enterpriseInfoSerializer;

  @nullable
  EnterpriseType get enterprise_type;

  @nullable
  String get email_enterprise;

  @nullable
  String get enterprise_name;

  @nullable
  String get description;

  @nullable
  bool get own_enterprise;

  @nullable
  String get facebook;

  @nullable
  String get linkedin;

  @nullable
  String get twitter;

  @nullable
  double get share_price;

  @nullable
  String get country;

  @nullable
  String get city;

  @nullable
  String get photo;

  @nullable
  String get phone;

  @nullable
  int get value;

  @nullable
  int get id;

  factory EnterpriseInfo.fromJson(Map<String, dynamic> json) {
    final data = json['enterprise'];

    return EnterpriseInfo((b) => b
      ..enterprise_type = EnterpriseType.from(data['enterprise_type'])
      ..email_enterprise = data['email_enterprise']
      ..enterprise_name = data['enterprise_name']
      ..description = data['description']
      ..own_enterprise = data['own_enterprise']
      ..facebook = data['facebook']
      ..linkedin = data['linkedin']
      ..twitter = data['twitter']
      ..share_price = data['share_price']
      ..country = data['country']
      ..city = data['city']
      ..photo = data['photo']
      ..phone = data['phone']
      ..value = data['value']
      ..id = data['id']);
  }

  factory EnterpriseInfo.of(dynamic data) {
    return EnterpriseInfo((b) => b
      ..enterprise_type = EnterpriseType.from(data['enterprise_type'])
      ..email_enterprise = data['email_enterprise']
      ..enterprise_name = data['enterprise_name']
      ..description = data['description']
      ..own_enterprise = data['own_enterprise']
      ..facebook = data['facebook']
      ..linkedin = data['linkedin']
      ..twitter = data['twitter']
      ..share_price = data['share_price']
      ..country = data['country']
      ..city = data['city']
      ..photo = data['photo']
      ..phone = data['phone']
      ..value = data['value']
      ..id = data['id']);
  }
}
