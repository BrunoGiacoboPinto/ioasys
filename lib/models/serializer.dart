import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:ioasys/models/enterprise_info.dart';
import 'package:ioasys/models/enterprise_type.dart';

part 'serializer.g.dart';

@SerializersFor([EnterpriseType, EnterpriseInfo])
final Serializers serializer =
    (_$serializer.toBuilder()..addPlugin(StandardJsonPlugin())).build();
