import 'package:dio/dio.dart';
import 'package:ioasys/models/enterprise_info.dart';
import 'package:ioasys/models/enterprise_list.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://empresas.ioasys.com.br/api/v1/')
abstract class EnterpriseApiClient {
  factory EnterpriseApiClient(Dio dio) = _EnterpriseApiClient;

  @GET('/enterprises')
  Future<HttpResponse<EnterpriseInfoList>> getEnterprises(
      {@Header('uid') String uid,
      @Header('client') String client,
      @Header('access-token') String accessToken});

  @GET('/enterprises/{id}')
  Future<HttpResponse<EnterpriseInfo>> getEnterpriseById(
      {@Path('id') int id,
      @Header('uid') String uid,
      @Header('client') String client,
      @Header('access-token') String accessToken});

  @GET('/enterprises')
  Future<HttpResponse<EnterpriseInfoList>> getEnterprisesWithFilter(
      {@Query('enterprise_types') int type,
      @Query('name') String name,
      @Header('uid') String uid,
      @Header('client') String client,
      @Header('access-token') String accessToken});
}
