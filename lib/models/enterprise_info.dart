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
  int get share_price;

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

  factory EnterpriseInfo.from(Map<String, dynamic> json) =>
      EnterpriseInfo((b) => b
        ..enterprise_type = EnterpriseType.from(json['enterprise_type'])
        ..email_enterprise = json['email_enterprise']
        ..enterprise_name = json['enterprise_name']
        ..description = json['description']
        ..own_enterprise = json['own_enterprise']
        ..facebook = json['facebook']
        ..linkedin = json['linkedin']
        ..twitter = json['twitter']
        ..share_price = json['share_price']
        ..country = json['country']
        ..city = json['city']
        ..photo = json['photo']
        ..phone = json['phone']
        ..value = json['value']
        ..id = json['id']);
}
