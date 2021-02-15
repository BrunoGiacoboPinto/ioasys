// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enterprise_list.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EnterpriseInfoList> _$enterpriseInfoListSerializer =
    new _$EnterpriseInfoListSerializer();

class _$EnterpriseInfoListSerializer
    implements StructuredSerializer<EnterpriseInfoList> {
  @override
  final Iterable<Type> types = const [EnterpriseInfoList, _$EnterpriseInfoList];
  @override
  final String wireName = 'EnterpriseInfoList';

  @override
  Iterable<Object> serialize(Serializers serializers, EnterpriseInfoList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.enterprises != null) {
      result
        ..add('enterprises')
        ..add(serializers.serialize(object.enterprises,
            specifiedType:
                const FullType(List, const [const FullType(EnterpriseInfo)])));
    }
    return result;
  }

  @override
  EnterpriseInfoList deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EnterpriseInfoListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'enterprises':
          result.enterprises = serializers.deserialize(value,
                  specifiedType: const FullType(
                      List, const [const FullType(EnterpriseInfo)]))
              as List<EnterpriseInfo>;
          break;
      }
    }

    return result.build();
  }
}

class _$EnterpriseInfoList extends EnterpriseInfoList {
  @override
  final List<EnterpriseInfo> enterprises;

  factory _$EnterpriseInfoList(
          [void Function(EnterpriseInfoListBuilder) updates]) =>
      (new EnterpriseInfoListBuilder()..update(updates)).build();

  _$EnterpriseInfoList._({this.enterprises}) : super._();

  @override
  EnterpriseInfoList rebuild(
          void Function(EnterpriseInfoListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnterpriseInfoListBuilder toBuilder() =>
      new EnterpriseInfoListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnterpriseInfoList && enterprises == other.enterprises;
  }

  @override
  int get hashCode {
    return $jf($jc(0, enterprises.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EnterpriseInfoList')
          ..add('enterprises', enterprises))
        .toString();
  }
}

class EnterpriseInfoListBuilder
    implements Builder<EnterpriseInfoList, EnterpriseInfoListBuilder> {
  _$EnterpriseInfoList _$v;

  List<EnterpriseInfo> _enterprises;
  List<EnterpriseInfo> get enterprises => _$this._enterprises;
  set enterprises(List<EnterpriseInfo> enterprises) =>
      _$this._enterprises = enterprises;

  EnterpriseInfoListBuilder();

  EnterpriseInfoListBuilder get _$this {
    if (_$v != null) {
      _enterprises = _$v.enterprises;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnterpriseInfoList other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EnterpriseInfoList;
  }

  @override
  void update(void Function(EnterpriseInfoListBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EnterpriseInfoList build() {
    final _$result =
        _$v ?? new _$EnterpriseInfoList._(enterprises: enterprises);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
