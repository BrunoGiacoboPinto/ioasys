import 'package:ioasys/models/auth_credentials.dart';

abstract class LoginState {}

class LoginLoadingState extends LoginState {}

class LoginInitialState extends LoginState {}

class LoginErrorState extends LoginState {}

class LoginSuccessState extends LoginState {
  final AuthCredentials authCredentials;

  LoginSuccessState(this.authCredentials);
}
