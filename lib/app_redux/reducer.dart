import 'package:ioasys/models/auth_credentials.dart';
import 'package:ioasys/search_redux/reducer.dart';

import 'state.dart';

AppState reducer(AppState prev, dynamic action) {
  return AppState.copyWith(
      searchArg: searchReducer(prev.searchState, action),
      authArg: AuthCredentials((b) => b
        ..client = 'gqJNfjnJHyiaUYtXnFfuNg'
        ..uid = 'testeapple@ioasys.com.br'
        ..accessToken = 'JaQJqgiqKsZoEj6XdEZpxQ'));
}
