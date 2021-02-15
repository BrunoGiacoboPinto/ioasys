import 'package:base/base.dart';
import 'package:ioasys/app_redux/state.dart';
import 'package:ioasys/login_redux/action.dart';
import 'package:ioasys/login_redux/state.dart';
import 'package:redux/redux.dart';

class LoginViewModel extends ViewModel<AppState> {
  LoginViewModel(Store<AppState> store) : super(store);

  LoginState get state => store.state.loginState;

  void logUserIn(Map<String, dynamic> credentials) {
    store.dispatch(LogUserInAction(credentials));
  }
}
