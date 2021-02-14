import 'package:base/base.dart';
import 'package:ioasys/app_redux/state.dart';
import 'package:redux/redux.dart';

class LoginViewModel extends ViewModel<AppState> {
  LoginViewModel(Store<AppState> store) : super(store);
}
