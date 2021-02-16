import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ioasys/app_redux/reducer.dart';
import 'package:ioasys/app_redux/state.dart';
import 'package:ioasys/auth/auth_client.dart';
import 'package:ioasys/login_redux/action.dart';
import 'package:ioasys/login_redux/middleware.dart';
import 'package:ioasys/login_redux/state.dart';
import 'package:ioasys/models/sign_up_response.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:retrofit/retrofit.dart' as retrofit;

class MockAuthApi extends Mock implements AuthApiClient {}

class MockConnChecker extends Mock implements DataConnectionChecker {}

void main() async {
  final authApiClient = MockAuthApi();
  final connChecker = MockConnChecker();

  Store<AppState> store;

  setUp(() {
    store = Store<AppState>(reducer,
        initialState: AppState.initial(),
        middleware: loginMiddleware(authApiClient, connChecker));
  });

  final successApiResponse = {
    "investor": {
      "id": 1,
      "investor_name": "Teste Apple",
      "email": "testeapple@ioasys.com.br",
      "city": "BH",
      "country": "Brasil",
      "balance": 1000000.0,
      "photo": null,
      "portfolio": {"enterprises_number": 0, "enterprises": []},
      "portfolio_value": 1000000.0,
      "first_access": false,
      "super_angel": false
    },
    "enterprise": null,
    "success": true
  };

  final uid = 'testeapple@ioasys.com.br';
  final client = '_9ZfTLHnffET-ndG2nEgfQ';
  final accessToken = '18gPK0VnvePx1hOfQRwxhQ';

  final headers = Headers();
  headers.map.addAll({
    'access-token': [accessToken],
    'client': [client],
    'uid': [uid]
  });

  final jsonInput = {
    'email': 'testeapple@ioasys.com.br',
    'password': '12341234'
  };

  group('Test login successful behavior', () {
    test('Verify user logout successfully', () {
      store.dispatch(LogUserOutAction());
      expect(store.state.loginState, isA<LoginInitialState>());
    });

    test('Verify user logs in successfully', () async {
      final success = retrofit.HttpResponse<UserSignUpInfo>(
          UserSignUpInfo.fromJson(successApiResponse),
          Response(headers: headers, statusCode: 200));

      when(connChecker.hasConnection).thenAnswer((_) async => true);

      when(authApiClient.signUserIn(jsonInput))
          .thenAnswer((_) async => success);

      store.dispatch(LogUserInAction(jsonInput));

      await untilCalled(authApiClient.signUserIn(jsonInput));

      verify(authApiClient.signUserIn(jsonInput));
    });
  });

  group('Verify log in user fail conditions', () {
    test('Login should fail if there is no internet connection', () async {
      final success = retrofit.HttpResponse<UserSignUpInfo>(
          UserSignUpInfo.fromJson(successApiResponse),
          Response(headers: headers, statusCode: 200));

      when(connChecker.hasConnection).thenAnswer((_) async => true);

      when(authApiClient.signUserIn(jsonInput))
          .thenAnswer((_) async => success);

      verifyZeroInteractions(authApiClient);
    });
  });
}
