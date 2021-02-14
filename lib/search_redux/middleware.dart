import 'dart:async';

import 'package:async/async.dart';
import 'package:base/base.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:ioasys/api/api_client.dart';
import 'package:ioasys/app_redux/state.dart';
import 'package:ioasys/models/enterprise_list.dart';
import 'package:ioasys/search_redux/state.dart';
import 'package:redux/redux.dart';
import 'package:retrofit/dio.dart';

import 'action.dart';

class SearchMiddleware extends MiddlewareClass<AppState> {
  final DataConnectionChecker checker;
  final EnterpriseApiClient apiClient;

  SearchMiddleware(this.apiClient, this.checker);

  Timer _timer;
  CancelableOperation<HttpResponse<EnterpriseInfoList>> _currentOperation;

  @override
  void call(Store<AppState> store, dynamic action, next) async {
    logger.d('[SearchMiddleware] searching for term ${action.name}');

    if (await checker.hasConnection) {
      // Cancel previous search attempt
      _timer?.cancel();
      _currentOperation?.cancel();

      store.dispatch(SearchLoadingAction());

      // Wait until user stop typing
      _timer = Timer(Duration(milliseconds: 250), () {
        final client = store.state.client;
        final token = store.state.token;
        final uid = store.state.uid;

        _currentOperation = CancelableOperation.fromFuture(apiClient
            .getEnterprisesWithName(
              accessToken: token,
              name: action.name,
              client: client,
              uid: uid,
            )
            .then((response) =>
                store.dispatch(SearchResultCompletedAction(response.data))));
      });
    } else {
      store.dispatch(SearchError());
    }

    next(action);
  }
}
