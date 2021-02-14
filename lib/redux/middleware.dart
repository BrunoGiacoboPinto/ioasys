import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:ioasys/api/api_client.dart';
import 'package:ioasys/search/action.dart';
import 'package:ioasys/search/middleware.dart';
import 'package:redux/redux.dart';

import 'state.dart';

List<Middleware<AppState>> middleware(GlobalKey<NavigatorState> navigator) {
  final enterpriseApi = EnterpriseApiClient(Dio(BaseOptions(
    headers: {'Content-Type': 'application/json'},
    connectTimeout: 5000,
    receiveTimeout: 5000,
  )));

  final connChecker = DataConnectionChecker();

  return [
    TypedMiddleware<AppState, SearchAction>(
        SearchMiddleware(enterpriseApi, connChecker))
  ];
}
