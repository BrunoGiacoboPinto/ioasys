import 'package:base/base.dart';
import 'package:ioasys/login_redux/state.dart';
import 'package:ioasys/models/auth_credentials.dart';
import 'package:ioasys/search_redux/state.dart';

class AppState extends BaseState {
  final LoginState loginState;
  final SearchState searchState;

  AuthCredentials get _authCredentials {
    return (loginState as LoginSuccessState).authCredentials;
  }

  String get token => _authCredentials.accessToken;
  String get client => _authCredentials.client;
  String get uid => _authCredentials.uid;

  AppState({this.searchState, this.loginState});

  factory AppState.initial() => AppState(
      searchState: SearchInitialSate(), loginState: LoginInitialState());

  factory AppState.copyWith({SearchState searchArg, LoginState loginArg}) =>
      AppState(searchState: searchArg, loginState: loginArg);
}
