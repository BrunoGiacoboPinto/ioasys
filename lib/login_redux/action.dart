import 'package:ioasys/models/auth_credentials.dart';

class LoginLoadingAction {}

class LoginFailedAction {}

class LoginErrorAction {}

class LogUserInAction {
  final Map<String, String> credentials;

  LogUserInAction(this.credentials);
}

class LogUserSuccessAction {
  final AuthCredentials authCredentials;

  LogUserSuccessAction(this.authCredentials);
}

class LogUserOutAction {}
