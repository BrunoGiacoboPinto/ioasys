import 'package:base/base.dart';
import 'package:ioasys/filter_redux/state.dart';
import 'package:ioasys/login_redux/state.dart';
import 'package:ioasys/models/auth_credentials.dart';
import 'package:ioasys/search_redux/state.dart';

class AppState extends BaseState {
  final LoginState loginState;
  final SearchState searchState;
  final FilterState filterState;

  AuthCredentials get authCredentials {
    return (loginState as LoginSuccessState).authCredentials;
  }

  AppState({this.filterState, this.searchState, this.loginState});

  factory AppState.initial() => AppState(
      filterState: FilterEmptyState(),
      searchState: SearchInitialSate(),
      loginState: LoginInitialState());

  factory AppState.copyWith(
          {SearchState searchArg,
          FilterState filterArg,
          LoginState loginArg}) =>
      AppState(
          searchState: searchArg, filterState: filterArg, loginState: loginArg);
}
