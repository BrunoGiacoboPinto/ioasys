import 'package:base/base.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ioasys/app_redux/state.dart';
import 'package:ioasys/auth/auth_client.dart';
import 'package:ioasys/login_redux/action.dart';
import 'package:ioasys/models/auth_credentials.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> loginMiddleware(
        AuthApiClient authClient, DataConnectionChecker checker) =>
    [
      TypedMiddleware<AppState, LogUserOutAction>(LogUserOutMiddleware()),
      TypedMiddleware<AppState, LogUserInAction>(
          LogUserInMiddleware(checker, authClient))
    ];

class LogUserOutMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, action, next) {
    next(action);
    store.dispatch(NavigateReplaceUntilAction('/login'));
  }
}

class LogUserInMiddleware extends MiddlewareClass<AppState> {
  final DataConnectionChecker checker;
  final AuthApiClient apiClient;

  LogUserInMiddleware(this.checker, this.apiClient);

  @override
  void call(Store<AppState> store, action, next) async {
    if (await checker.hasConnection) {
      store.dispatch(LoginLoadingAction());

      try {
        final res = await apiClient.signUserIn(action.credentials);

        final accessToken = res.response.headers.value('access-token');
        final client = res.response.headers.value('client');
        final uid = res.response.headers.value('uid');

        store.dispatch(LogUserSuccessAction(AuthCredentials((b) => b
          ..accessToken = accessToken
          ..client = client
          ..uid = uid)));

        store.dispatch(NavigateReplaceUntilAction('/dashboard'));
      } on DioError catch (err) {
        logger.d('Something whent wrong =${err.response.data}');
      }
    } else {
      store.dispatch(LoginErrorAction());
    }
  }
}
