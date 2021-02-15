import 'package:ioasys/login_redux/action.dart';
import 'package:redux/redux.dart';

import 'state.dart';

final loginReducer = combineReducers<LoginState>([
  TypedReducer<LoginState, LoginLoadingAction>(_onLoading),
  TypedReducer<LoginState, LogUserOutAction>(_onLogout),
  TypedReducer<LoginState, LoginErrorAction>(_onError),
  TypedReducer<LoginState, LogUserSuccessAction>(_onSuccess)
]);

LoginState _onLogout(LoginState prev, LogUserOutAction action) =>
    LoginInitialState();

LoginState _onLoading(LoginState prev, LoginLoadingAction action) =>
    LoginLoadingState();

LoginState _onError(LoginState prev, LoginErrorAction action) =>
    LoginErrorState(action.reason);

LoginState _onSuccess(LoginState prev, LogUserSuccessAction action) =>
    LoginSuccessState(action.authCredentials);
