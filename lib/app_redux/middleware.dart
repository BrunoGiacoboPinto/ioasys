import 'package:base/base.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:ioasys/api/api_client.dart';
import 'package:ioasys/auth/auth_client.dart';
import 'package:ioasys/login_redux/middleware.dart';
import 'package:ioasys/search_redux/action.dart';
import 'package:ioasys/search_redux/middleware.dart';
import 'package:redux/redux.dart';

import 'state.dart';

List<Middleware<AppState>> middleware(GlobalKey<NavigatorState> navigator) {
  /*
  * In the context of Redux architecture, here is the point where
  * dependency injection could happen either automatically or manually.
  *
  * Once this function is guaranteed to be called once, all dependencies
  * are effectively singletons throughout all app lifecycle.
  *
  * This is called functional dependency injection.
  *
  * */

  final connChecker = DataConnectionChecker();

  final enterpriseApi = EnterpriseApiClient(Dio(BaseOptions(
    headers: {'Content-Type': 'application/json'},
    connectTimeout: 5000,
    receiveTimeout: 5000,
  )));

  final authApi = AuthApiClient(Dio(BaseOptions(
    headers: {'Content-Type': 'application/json'},
    connectTimeout: 5000,
    receiveTimeout: 5000,
  )));

  return []
    ..add(TypedMiddleware<AppState, SearchAction>(
        SearchMiddleware(enterpriseApi, connChecker)))
    ..addAll(loginMiddleware(authApi, connChecker))
    ..addAll(navigationMiddleware(navigator));
}
