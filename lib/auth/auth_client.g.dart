// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AuthApiClient implements AuthApiClient {
  _AuthApiClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://empresas.ioasys.com.br/api/v1/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<HttpResponse<UserSignUpInfo>> signUserIn(json) async {
    ArgumentError.checkNotNull(json, 'json');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(json ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/users/auth/sign_in',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserSignUpInfo.fromJson(_result.data);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }
}
