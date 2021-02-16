import 'dart:async';

import 'package:async/async.dart';
import 'package:base/base.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ioasys/app_redux/state.dart';
import 'package:ioasys/login_redux/action.dart';
import 'package:ioasys/models/enterprise_list.dart';
import 'package:ioasys/persistence/repository.dart';
import 'package:redux/redux.dart';
import 'package:retrofit/dio.dart';

import 'action.dart';

class SearchMiddleware extends MiddlewareClass<AppState> {
  final DataConnectionChecker checker;
  final EnterprisesRepository repository;

  SearchMiddleware(this.repository, this.checker);

  Timer _timer;
  CancelableOperation<HttpResponse<EnterpriseInfoList>> _currentOperation;

  Future<void> _handleSearchErrors(
      Exception ex, StackTrace stack, Store<AppState> store) {
    if (ex is DioError) {
      // User session credentials expired, requesting new one since we dont keep
      // his password.
      if (ex.response.statusCode == 401) {
        Future.delayed(Duration(milliseconds: 850), () {
          store.dispatch(
              LoginErrorAction('User session expired. Please log in again.'));
        });

        store.dispatch(LogUserOutAction());
      } else {
        store.dispatch(
            SearchErrorAction('Our services are momentarely unavailable.'));
      }
    } else {
      store.dispatch('Somenthing went really arraaay :(');
    }
  }

  @override
  void call(Store<AppState> store, dynamic action, next) async {
    if (action.name.isEmpty) {
      store.dispatch(SearchResetAction());
      return;
    }

    final filter = store.state.filterState;
    final credentials = store.state.authCredentials;

    logger.d(
        '[SearchMiddleware] searching for term ${action.name} with ${filter.runtimeType}');

    if (await checker.hasConnection) {
      // Cancel previous search attempt
      _timer?.cancel();
      _currentOperation?.cancel();

      store.dispatch(SearchLoadingAction());

      // Wait until user stop typing
      _timer = Timer(Duration(milliseconds: 250), () {
        _currentOperation = CancelableOperation.fromFuture(repository
            .fetch(action.name, credentials, filter)
            .then((data) => store.dispatch(data.enterprises.isEmpty
                ? SearchEmptyAction()
                : SearchResultCompletedAction(data)))
            .catchError((ex, stack) => _handleSearchErrors(ex, stack, store)));
      });
    } else {
      // Return already searched companies, even offline
      if (repository.contains(action.name, filter)) {
        final data = await repository.fetch(action.name, credentials, filter);
        store.dispatch(SearchResultCompletedAction(data));
      } else {
        store.dispatch(SearchErrorAction(
            'Fail to connect to the internet. Check your connection.'));
      }
    }

    next(action);
  }
}
