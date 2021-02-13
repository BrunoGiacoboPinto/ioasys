// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enterprise_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EnterpriseInfo> _$enterpriseInfoSerializer =
    new _$EnterpriseInfoSerializer();

class _$EnterpriseInfoSerializer
    implements StructuredSerializer<EnterpriseInfo> {
  @override
  final Iterable<Type> types = const [EnterpriseInfo, _$EnterpriseInfo];
  @override
  final String wireName = 'EnterpriseInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, EnterpriseInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.enterprise_type != null) {
      result
        ..add('enterprise_type')
        ..add(serializers.serialize(object.enterprise_type,
            specifiedType: const FullType(EnterpriseType)));
    }
    if (object.email_enterprise != null) {
      result
        ..add('email_enterprise')
        ..add(serializers.serialize(object.email_enterprise,
            specifiedType: const FullType(String)));
    }
    if (object.enterprise_name != null) {
      result
        ..add('enterprise_name')
        ..add(serializers.serialize(object.enterprise_name,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.own_enterprise != null) {
      result
        ..add('own_enterprise')
        ..add(serializers.serialize(object.own_enterprise,
            specifiedType: const FullType(bool)));
    }
    if (object.facebook != null) {
      result
        ..add('facebook')
        ..add(serializers.serialize(object.facebook,
            specifiedType: const FullType(String)));
    }
    if (object.linkedin != null) {
      result
        ..add('linkedin')
        ..add(serializers.serialize(object.linkedin,
            specifiedType: const FullType(String)));
    }
    if (object.twitter != null) {
      result
        ..add('twitter')
        ..add(serializers.serialize(object.twitter,
            specifiedType: const FullType(String)));
    }
    if (object.share_price != null) {
      result
        ..add('share_price')
        ..add(serializers.serialize(object.share_price,
            specifiedType: const FullType(double)));
    }
    if (object.country != null) {
      result
        ..add('country')
        ..add(serializers.serialize(object.country,
            specifiedType: const FullType(String)));
    }
    if (object.city != null) {
      result
        ..add('city')
        ..add(serializers.serialize(object.city,
            specifiedType: const FullType(String)));
    }
    if (object.photo != null) {
      result
        ..add('photo')
        ..add(serializers.serialize(object.photo,
            specifiedType: const FullType(String)));
    }
    if (object.phone != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(object.phone,
            specifiedType: const FullType(String)));
    }
    if (object.value != null) {
      result
        ..add('value')
        ..add(serializers.serialize(object.value,
            specifiedType: const FullType(int)));
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
  EnterpriseInfo deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EnterpriseInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'enterprise_type':
          result.enterprise_type.replace(serializers.deserialize(value,
              specifiedType: const FullType(EnterpriseType)) as EnterpriseType);
          break;
        case 'email_enterprise':
          result.email_enterprise = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'enterprise_name':
          result.enterprise_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'own_enterprise':
          result.own_enterprise = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'facebook':
          result.facebook = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'linkedin':
          result.linkedin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'twitter':
          result.twitter = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'share_price':
          result.share_price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo':
          result.photo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$EnterpriseInfo extends EnterpriseInfo {
  @override
  final EnterpriseType enterprise_type;
  @override
  final String email_enterprise;
  @override
  final String enterprise_name;
  @override
  final String description;
  @override
  final bool own_enterprise;
  @override
  final String facebook;
  @override
  final String linkedin;
  @override
  final String twitter;
  @override
  final double share_price;
  @override
  final String country;
  @override
  final String city;
  @override
  final String photo;
  @override
  final String phone;
  @override
  final int value;
  @override
  final int id;

  factory _$EnterpriseInfo([void Function(EnterpriseInfoBuilder) updates]) =>
      (new EnterpriseInfoBuilder()..update(updates)).build();

  _$EnterpriseInfo._(
      {this.enterprise_type,
      this.email_enterprise,
      this.enterprise_name,
      this.description,
      this.own_enterprise,
      this.facebook,
      this.linkedin,
      this.twitter,
      this.share_price,
      this.country,
      this.city,
      this.photo,
      this.phone,
      this.value,
      this.id})
      : super._();

  @override
  EnterpriseInfo rebuild(void Function(EnterpriseInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnterpriseInfoBuilder toBuilder() =>
      new EnterpriseInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnterpriseInfo &&
        enterprise_type == other.enterprise_type &&
        email_enterprise == other.email_enterprise &&
        enterprise_name == other.enterprise_name &&
        description == other.description &&
        own_enterprise == other.own_enterprise &&
        facebook == other.facebook &&
        linkedin == other.linkedin &&
        twitter == other.twitter &&
        share_price == other.share_price &&
        country == other.country &&
        city == other.city &&
        photo == other.photo &&
        phone == other.phone &&
        value == other.value &&
        id == other.id;
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
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                0,
                                                                enterprise_type
                                                                    .hashCode),
                                                            email_enterprise
                                                                .hashCode),
                                                        enterprise_name
                                                            .hashCode),
                                                    description.hashCode),
                                                own_enterprise.hashCode),
                                            facebook.hashCode),
                                        linkedin.hashCode),
                                    twitter.hashCode),
                                share_price.hashCode),
                            country.hashCode),
                        city.hashCode),
                    photo.hashCode),
                phone.hashCode),
            value.hashCode),
        id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EnterpriseInfo')
          ..add('enterprise_type', enterprise_type)
          ..add('email_enterprise', email_enterprise)
          ..add('enterprise_name', enterprise_name)
          ..add('description', description)
          ..add('own_enterprise', own_enterprise)
          ..add('facebook', facebook)
          ..add('linkedin', linkedin)
          ..add('twitter', twitter)
          ..add('share_price', share_price)
          ..add('country', country)
          ..add('city', city)
          ..add('photo', photo)
          ..add('phone', phone)
          ..add('value', value)
          ..add('id', id))
        .toString();
  }
}

class EnterpriseInfoBuilder
    implements Builder<EnterpriseInfo, EnterpriseInfoBuilder> {
  _$EnterpriseInfo _$v;

  EnterpriseTypeBuilder _enterprise_type;
  EnterpriseTypeBuilder get enterprise_type =>
      _$this._enterprise_type ??= new EnterpriseTypeBuilder();
  set enterprise_type(EnterpriseTypeBuilder enterprise_type) =>
      _$this._enterprise_type = enterprise_type;

  String _email_enterprise;
  String get email_enterprise => _$this._email_enterprise;
  set email_enterprise(String email_enterprise) =>
      _$this._email_enterprise = email_enterprise;

  String _enterprise_name;
  String get enterprise_name => _$this._enterprise_name;
  set enterprise_name(String enterprise_name) =>
      _$this._enterprise_name = enterprise_name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  bool _own_enterprise;
  bool get own_enterprise => _$this._own_enterprise;
  set own_enterprise(bool own_enterprise) =>
      _$this._own_enterprise = own_enterprise;

  String _facebook;
  String get facebook => _$this._facebook;
  set facebook(String facebook) => _$this._facebook = facebook;

  String _linkedin;
  String get linkedin => _$this._linkedin;
  set linkedin(String linkedin) => _$this._linkedin = linkedin;

  String _twitter;
  String get twitter => _$this._twitter;
  set twitter(String twitter) => _$this._twitter = twitter;

  double _share_price;
  double get share_price => _$this._share_price;
  set share_price(double share_price) => _$this._share_price = share_price;

  String _country;
  String get country => _$this._country;
  set country(String country) => _$this._country = country;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  String _photo;
  String get photo => _$this._photo;
  set photo(String photo) => _$this._photo = photo;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  int _value;
  int get value => _$this._value;
  set value(int value) => _$this._value = value;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  EnterpriseInfoBuilder();

  EnterpriseInfoBuilder get _$this {
    if (_$v != null) {
      _enterprise_type = _$v.enterprise_type?.toBuilder();
      _email_enterprise = _$v.email_enterprise;
      _enterprise_name = _$v.enterprise_name;
      _description = _$v.description;
      _own_enterprise = _$v.own_enterprise;
      _facebook = _$v.facebook;
      _linkedin = _$v.linkedin;
      _twitter = _$v.twitter;
      _share_price = _$v.share_price;
      _country = _$v.country;
      _city = _$v.city;
      _photo = _$v.photo;
      _phone = _$v.phone;
      _value = _$v.value;
      _id = _$v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnterpriseInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EnterpriseInfo;
  }

  @override
  void update(void Function(EnterpriseInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EnterpriseInfo build() {
    _$EnterpriseInfo _$result;
    try {
      _$result = _$v ??
          new _$EnterpriseInfo._(
              enterprise_type: _enterprise_type?.build(),
              email_enterprise: email_enterprise,
              enterprise_name: enterprise_name,
              description: description,
              own_enterprise: own_enterprise,
              facebook: facebook,
              linkedin: linkedin,
              twitter: twitter,
              share_price: share_price,
              country: country,
              city: city,
              photo: photo,
              phone: phone,
              value: value,
              id: id);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'enterprise_type';
        _enterprise_type?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EnterpriseInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
