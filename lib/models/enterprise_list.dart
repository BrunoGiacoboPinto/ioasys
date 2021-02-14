import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'enterprise_info.dart';

part 'enterprise_list.g.dart';

abstract class EnterpriseInfoList
    implements Built<EnterpriseInfoList, EnterpriseInfoListBuilder> {
  EnterpriseInfoList._();

  factory EnterpriseInfoList(
          [void Function(EnterpriseInfoListBuilder) updates]) =
      _$EnterpriseInfoList;

  static Serializer<EnterpriseInfoList> get serializer =>
      _$enterpriseInfoListSerializer;

  @nullable
  List<EnterpriseInfo> get enterprises;

  factory EnterpriseInfoList.fromJson(Map<String, dynamic> json) =>
      EnterpriseInfoList((b) => b
        ..enterprises = (json['enterprises'] as List<dynamic>)
            .map((e) => EnterpriseInfo.of(e))
            .toList());
}
