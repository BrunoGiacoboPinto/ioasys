import 'package:ioasys/login_redux/reducer.dart';
import 'package:ioasys/search_redux/reducer.dart';

import 'state.dart';

AppState reducer(AppState prev, dynamic action) {
  return AppState.copyWith(
      searchArg: searchReducer(prev.searchState, action),
      loginArg: loginReducer(prev.loginState, action));
}
