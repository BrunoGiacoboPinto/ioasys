// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserSignUpInfo> _$userSignUpInfoSerializer =
    new _$UserSignUpInfoSerializer();

class _$UserSignUpInfoSerializer
    implements StructuredSerializer<UserSignUpInfo> {
  @override
  final Iterable<Type> types = const [UserSignUpInfo, _$UserSignUpInfo];
  @override
  final String wireName = 'UserSignUpInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, UserSignUpInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.portfolio_value != null) {
      result
        ..add('portfolio_value')
        ..add(serializers.serialize(object.portfolio_value,
            specifiedType: const FullType(int)));
    }
    if (object.first_access != null) {
      result
        ..add('first_access')
        ..add(serializers.serialize(object.first_access,
            specifiedType: const FullType(bool)));
    }
    if (object.super_angel != null) {
      result
        ..add('super_angel')
        ..add(serializers.serialize(object.super_angel,
            specifiedType: const FullType(bool)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.investor_name != null) {
      result
        ..add('investor_name')
        ..add(serializers.serialize(object.investor_name,
            specifiedType: const FullType(String)));
    }
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.balance != null) {
      result
        ..add('balance')
        ..add(serializers.serialize(object.balance,
            specifiedType: const FullType(int)));
    }
    if (object.photo != null) {
      result
        ..add('photo')
        ..add(serializers.serialize(object.photo,
            specifiedType: const FullType(String)));
    }
    if (object.city != null) {
      result
        ..add('city')
        ..add(serializers.serialize(object.city,
            specifiedType: const FullType(String)));
    }
    if (object.country != null) {
      result
        ..add('country')
        ..add(serializers.serialize(object.country,
            specifiedType: const FullType(String)));
    }
    if (object.enterprise != null) {
      result
        ..add('enterprise')
        ..add(serializers.serialize(object.enterprise,
            specifiedType: const FullType(String)));
    }
    if (object.success != null) {
      result
        ..add('success')
        ..add(serializers.serialize(object.success,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  UserSignUpInfo deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserSignUpInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'portfolio_value':
          result.portfolio_value = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'first_access':
          result.first_access = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'super_angel':
          result.super_angel = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'investor_name':
          result.investor_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'balance':
          result.balance = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'photo':
          result.photo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'enterprise':
          result.enterprise = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'success':
          result.success = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$UserSignUpInfo extends UserSignUpInfo {
  @override
  final int portfolio_value;
  @override
  final bool first_access;
  @override
  final bool super_angel;
  @override
  final int id;
  @override
  final String investor_name;
  @override
  final String email;
  @override
  final int balance;
  @override
  final String photo;
  @override
  final String city;
  @override
  final String country;
  @override
  final String enterprise;
  @override
  final bool success;

  factory _$UserSignUpInfo([void Function(UserSignUpInfoBuilder) updates]) =>
      (new UserSignUpInfoBuilder()..update(updates)).build();

  _$UserSignUpInfo._(
      {this.portfolio_value,
      this.first_access,
      this.super_angel,
      this.id,
      this.investor_name,
      this.email,
      this.balance,
      this.photo,
      this.city,
      this.country,
      this.enterprise,
      this.success})
      : super._();

  @override
  UserSignUpInfo rebuild(void Function(UserSignUpInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserSignUpInfoBuilder toBuilder() =>
      new UserSignUpInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserSignUpInfo &&
        portfolio_value == other.portfolio_value &&
        first_access == other.first_access &&
        super_angel == other.super_angel &&
        id == other.id &&
        investor_name == other.investor_name &&
        email == other.email &&
        balance == other.balance &&
        photo == other.photo &&
        city == other.city &&
        country == other.country &&
        enterprise == other.enterprise &&
        success == other.success;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(0,
                                                    portfolio_value.hashCode),
                                                first_access.hashCode),
                                            super_angel.hashCode),
                                        id.hashCode),
                                    investor_name.hashCode),
                                email.hashCode),
                            balance.hashCode),
                        photo.hashCode),
                    city.hashCode),
                country.hashCode),
            enterprise.hashCode),
        success.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserSignUpInfo')
          ..add('portfolio_value', portfolio_value)
          ..add('first_access', first_access)
          ..add('super_angel', super_angel)
          ..add('id', id)
          ..add('investor_name', investor_name)
          ..add('email', email)
          ..add('balance', balance)
          ..add('photo', photo)
          ..add('city', city)
          ..add('country', country)
          ..add('enterprise', enterprise)
          ..add('success', success))
        .toString();
  }
}

class UserSignUpInfoBuilder
    implements Builder<UserSignUpInfo, UserSignUpInfoBuilder> {
  _$UserSignUpInfo _$v;

  int _portfolio_value;
  int get portfolio_value => _$this._portfolio_value;
  set portfolio_value(int portfolio_value) =>
      _$this._portfolio_value = portfolio_value;

  bool _first_access;
  bool get first_access => _$this._first_access;
  set first_access(bool first_access) => _$this._first_access = first_access;

  bool _super_angel;
  bool get super_angel => _$this._super_angel;
  set super_angel(bool super_angel) => _$this._super_angel = super_angel;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _investor_name;
  String get investor_name => _$this._investor_name;
  set investor_name(String investor_name) =>
      _$this._investor_name = investor_name;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  int _balance;
  int get balance => _$this._balance;
  set balance(int balance) => _$this._balance = balance;

  String _photo;
  String get photo => _$this._photo;
  set photo(String photo) => _$this._photo = photo;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  String _country;
  String get country => _$this._country;
  set country(String country) => _$this._country = country;

  String _enterprise;
  String get enterprise => _$this._enterprise;
  set enterprise(String enterprise) => _$this._enterprise = enterprise;

  bool _success;
  bool get success => _$this._success;
  set success(bool success) => _$this._success = success;

  UserSignUpInfoBuilder();

  UserSignUpInfoBuilder get _$this {
    if (_$v != null) {
      _portfolio_value = _$v.portfolio_value;
      _first_access = _$v.first_access;
      _super_angel = _$v.super_angel;
      _id = _$v.id;
      _investor_name = _$v.investor_name;
      _email = _$v.email;
      _balance = _$v.balance;
      _photo = _$v.photo;
      _city = _$v.city;
      _country = _$v.country;
      _enterprise = _$v.enterprise;
      _success = _$v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserSignUpInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserSignUpInfo;
  }

  @override
  void update(void Function(UserSignUpInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserSignUpInfo build() {
    final _$result = _$v ??
        new _$UserSignUpInfo._(
            portfolio_value: portfolio_value,
            first_access: first_access,
            super_angel: super_angel,
            id: id,
            investor_name: investor_name,
            email: email,
            balance: balance,
            photo: photo,
            city: city,
            country: country,
            enterprise: enterprise,
            success: success);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
