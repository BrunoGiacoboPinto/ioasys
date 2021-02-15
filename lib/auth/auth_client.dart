import 'package:dio/dio.dart';
import 'package:ioasys/models/sign_up_response.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'auth_client.g.dart';

@RestApi(baseUrl: 'https://empresas.ioasys.com.br/api/v1/')
abstract class AuthApiClient {
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST('/users/auth/sign_in')
  Future<HttpResponse<UserSignUpInfo>> signUserIn(
      @Body() Map<String, dynamic> json);
}
