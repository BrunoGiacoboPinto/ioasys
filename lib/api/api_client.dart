import 'package:dio/dio.dart';
import 'package:ioasys/models/enterprise_info.dart';
import 'package:ioasys/models/enterprise_list.dart';
import 'package:ioasys/models/sign_up_response.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://empresas.ioasys.com.br/api/v1/')
abstract class EnterpriseApiClient {
  factory EnterpriseApiClient(Dio dio) = _EnterpriseApiClient;

  /* Missing fromjson
  @POST('/users/auth/sign_in')
  Future<HttpResponse<UserSignUpInfo>> signUserIn(
      @Body() Map<String, dynamic> json); */

  @GET('/enterprises')
  Future<HttpResponse<EnterpriseInfoList>> getEnterprises(
      {@Header('uid') String uid,
      @Header('client') String client,
      @Header('access-token') String accessToken});

  @GET('/enterprises')
  Future<HttpResponse> getEnterprisesWithFilter(
    @Query('enterprise_types') String type,
    @Query('name') String name,
  );

  @GET('/enterprises/{id}')
  Future<HttpResponse<EnterpriseInfo>> getEnterpriseById(
      {@Path('id') int id,
      @Header('uid') String uid,
      @Header('client') String client,
      @Header('access-token') String accessToken});
}

final enterpriseApi = EnterpriseApiClient(Dio(BaseOptions(
  headers: {'Content-Type': 'application/json'},
  connectTimeout: 5000,
  receiveTimeout: 5000,
)));
