import 'package:base/base.dart';
import 'package:ioasys/models/auth_credentials.dart';
import 'package:ioasys/search/state.dart';

class AppState extends BaseState {
  final AuthCredentials credentials;
  final SearchState searchState;

  String get token => credentials.accessToken;

  String get client => credentials.client;

  String get uid => credentials.uid;

  AppState({this.searchState, this.credentials});

  factory AppState.copyWith({SearchState searchArg, AuthCredentials authArg}) =>
      AppState(searchState: searchArg, credentials: authArg);
}
