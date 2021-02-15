import 'dart:async';

import 'package:async/async.dart';
import 'package:base/base.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:ioasys/app_redux/state.dart';
import 'package:ioasys/models/enterprise_list.dart';
import 'package:ioasys/persistence/repository.dart';
import 'package:ioasys/search_redux/state.dart';
import 'package:redux/redux.dart';
import 'package:retrofit/dio.dart';

import 'action.dart';

class SearchMiddleware extends MiddlewareClass<AppState> {
  final DataConnectionChecker checker;
  final EnterprisesRepository repository;

  SearchMiddleware(this.repository, this.checker);

  Timer _timer;
  CancelableOperation<HttpResponse<EnterpriseInfoList>> _currentOperation;

  @override
  void call(Store<AppState> store, dynamic action, next) async {
    logger.d('[SearchMiddleware] searching for term ${action.name}');

    if (action.name.isEmpty) {
      return store.dispatch(SearchResetAction());
    }

    if (await checker.hasConnection) {
      // Cancel previous search attempt
      _timer?.cancel();
      _currentOperation?.cancel();

      store.dispatch(SearchLoadingAction());

      // Wait until user stop typing
      _timer = Timer(Duration(milliseconds: 250), () {
        final credentials = store.state.authCredentials;

        _currentOperation = CancelableOperation.fromFuture(repository
            .fetch(action.name, credentials)
            .then((data) => store.dispatch(data.enterprises.isEmpty
                ? SearchEmptyAction()
                : SearchResultCompletedAction(data))));
      });
    } else {
      store.dispatch(SearchError());
    }

    next(action);
  }
}
