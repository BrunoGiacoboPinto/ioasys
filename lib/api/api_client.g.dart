// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _EnterpriseApiClient implements EnterpriseApiClient {
  _EnterpriseApiClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://empresas.ioasys.com.br/api/v1/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<HttpResponse<EnterpriseInfoList>> getEnterprises(
      {uid, client, accessToken}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/enterprises',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{
              r'uid': uid,
              r'client': client,
              r'access-token': accessToken
            },
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = EnterpriseInfoList.fromJson(_result.data);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<EnterpriseInfo>> getEnterpriseById(
      {id, uid, client, accessToken}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/enterprises/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{
              r'uid': uid,
              r'client': client,
              r'access-token': accessToken
            },
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = EnterpriseInfo.fromJson(_result.data);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<EnterpriseInfoList>> getEnterprisesWithFilter(
      {type, name, uid, client, accessToken}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'enterprise_types': type,
      r'name': name
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/enterprises',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{
              r'uid': uid,
              r'client': client,
              r'access-token': accessToken
            },
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = EnterpriseInfoList.fromJson(_result.data);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<EnterpriseInfoList>> getEnterprisesWithName(
      {name, uid, client, accessToken}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'name': name};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/enterprises',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{
              r'uid': uid,
              r'client': client,
              r'access-token': accessToken
            },
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = EnterpriseInfoList.fromJson(_result.data);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }
}
