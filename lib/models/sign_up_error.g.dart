// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_error.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserSignUpError> _$userSignUpErrorSerializer =
    new _$UserSignUpErrorSerializer();

class _$UserSignUpErrorSerializer
    implements StructuredSerializer<UserSignUpError> {
  @override
  final Iterable<Type> types = const [UserSignUpError, _$UserSignUpError];
  @override
  final String wireName = 'UserSignUpError';

  @override
  Iterable<Object> serialize(Serializers serializers, UserSignUpError object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.success != null) {
      result
        ..add('success')
        ..add(serializers.serialize(object.success,
            specifiedType: const FullType(bool)));
    }
    if (object.errors != null) {
      result
        ..add('errors')
        ..add(serializers.serialize(object.errors,
            specifiedType:
                const FullType(List, const [const FullType(String)])));
    }
    return result;
  }

  @override
  UserSignUpError deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserSignUpErrorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'errors':
          result.errors = serializers.deserialize(value,
                  specifiedType:
                      const FullType(List, const [const FullType(String)]))
              as List<String>;
          break;
      }
    }

    return result.build();
  }
}

class _$UserSignUpError extends UserSignUpError {
  @override
  final bool success;
  @override
  final List<String> errors;

  factory _$UserSignUpError([void Function(UserSignUpErrorBuilder) updates]) =>
      (new UserSignUpErrorBuilder()..update(updates)).build();

  _$UserSignUpError._({this.success, this.errors}) : super._();

  @override
  UserSignUpError rebuild(void Function(UserSignUpErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserSignUpErrorBuilder toBuilder() =>
      new UserSignUpErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserSignUpError &&
        success == other.success &&
        errors == other.errors;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, success.hashCode), errors.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserSignUpError')
          ..add('success', success)
          ..add('errors', errors))
        .toString();
  }
}

class UserSignUpErrorBuilder
    implements Builder<UserSignUpError, UserSignUpErrorBuilder> {
  _$UserSignUpError _$v;

  bool _success;
  bool get success => _$this._success;
  set success(bool success) => _$this._success = success;

  List<String> _errors;
  List<String> get errors => _$this._errors;
  set errors(List<String> errors) => _$this._errors = errors;

  UserSignUpErrorBuilder();

  UserSignUpErrorBuilder get _$this {
    if (_$v != null) {
      _success = _$v.success;
      _errors = _$v.errors;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserSignUpError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserSignUpError;
  }

  @override
  void update(void Function(UserSignUpErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserSignUpError build() {
    final _$result =
        _$v ?? new _$UserSignUpError._(success: success, errors: errors);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
