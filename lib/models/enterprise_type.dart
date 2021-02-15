import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'enterprise_type.g.dart';

abstract class EnterpriseType
    implements Built<EnterpriseType, EnterpriseTypeBuilder> {
  EnterpriseType._();

  factory EnterpriseType([void Function(EnterpriseTypeBuilder) updates]) =
      _$EnterpriseType;

  static Serializer<EnterpriseType> get serializer =>
      _$enterpriseTypeSerializer;

  @nullable
  String get enterprise_type_name;

  @nullable
  int get id;

  static EnterpriseTypeBuilder from(Map<String, dynamic> json) =>
      EnterpriseTypeBuilder()
        ..enterprise_type_name = json['enterprise_type_name']
        ..id = json['id'];
}
