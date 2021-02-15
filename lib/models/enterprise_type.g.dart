// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enterprise_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EnterpriseType> _$enterpriseTypeSerializer =
    new _$EnterpriseTypeSerializer();

class _$EnterpriseTypeSerializer
    implements StructuredSerializer<EnterpriseType> {
  @override
  final Iterable<Type> types = const [EnterpriseType, _$EnterpriseType];
  @override
  final String wireName = 'EnterpriseType';

  @override
  Iterable<Object> serialize(Serializers serializers, EnterpriseType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.enterprise_type_name != null) {
      result
        ..add('enterprise_type_name')
        ..add(serializers.serialize(object.enterprise_type_name,
            specifiedType: const FullType(String)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  EnterpriseType deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EnterpriseTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'enterprise_type_name':
          result.enterprise_type_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$EnterpriseType extends EnterpriseType {
  @override
  final String enterprise_type_name;
  @override
  final int id;

  factory _$EnterpriseType([void Function(EnterpriseTypeBuilder) updates]) =>
      (new EnterpriseTypeBuilder()..update(updates)).build();

  _$EnterpriseType._({this.enterprise_type_name, this.id}) : super._();

  @override
  EnterpriseType rebuild(void Function(EnterpriseTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnterpriseTypeBuilder toBuilder() =>
      new EnterpriseTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnterpriseType &&
        enterprise_type_name == other.enterprise_type_name &&
        id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, enterprise_type_name.hashCode), id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EnterpriseType')
          ..add('enterprise_type_name', enterprise_type_name)
          ..add('id', id))
        .toString();
  }
}

class EnterpriseTypeBuilder
    implements Builder<EnterpriseType, EnterpriseTypeBuilder> {
  _$EnterpriseType _$v;

  String _enterprise_type_name;
  String get enterprise_type_name => _$this._enterprise_type_name;
  set enterprise_type_name(String enterprise_type_name) =>
      _$this._enterprise_type_name = enterprise_type_name;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  EnterpriseTypeBuilder();

  EnterpriseTypeBuilder get _$this {
    if (_$v != null) {
      _enterprise_type_name = _$v.enterprise_type_name;
      _id = _$v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnterpriseType other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EnterpriseType;
  }

  @override
  void update(void Function(EnterpriseTypeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EnterpriseType build() {
    final _$result = _$v ??
        new _$EnterpriseType._(
            enterprise_type_name: enterprise_type_name, id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
