import 'package:base/base.dart';
import 'package:ioasys/login_redux/state.dart';
import 'package:ioasys/models/auth_credentials.dart';
import 'package:ioasys/search_redux/state.dart';

class AppState extends BaseState {
  final LoginState loginState;
  final SearchState searchState;

  AuthCredentials get authCredentials {
    return (loginState as LoginSuccessState).authCredentials;
  }

  AppState({this.searchState, this.loginState});

  factory AppState.initial() => AppState(
      searchState: SearchInitialSate(), loginState: LoginInitialState());

  factory AppState.copyWith({SearchState searchArg, LoginState loginArg}) =>
      AppState(searchState: searchArg, loginState: loginArg);
}
