import 'package:ioasys/models/auth_credentials.dart';
import 'package:ioasys/search_redux/reducer.dart';

import 'state.dart';

AppState reducer(AppState prev, dynamic action) {
  return AppState.copyWith(
      searchArg: searchReducer(prev.searchState, action),
      authArg: AuthCredentials((b) => b
        ..client = 'Mq6fu2VRB3ZcbTlnFs8usw'
        ..uid = 'testeapple@ioasys.com.br'
        ..accessToken = '_P8V7agHksZk58AZIDk0Sw'));
}
