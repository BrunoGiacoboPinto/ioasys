import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:ioasys/app_redux/state.dart';
import 'package:ioasys/login/layout/login_form.dart';
import 'package:ioasys/login/viewmodel.dart';
import 'package:redux/redux.dart';

import 'file:///C:/Users/BrunoGiacobo/Documents/Code/ioasys/lib/login/layout/curved_container.dart';

class LoginView extends View<LoginViewModel, AppState> {
  @override
  LoginViewModel createViewModel(Store<AppState> store) {
    return LoginViewModel(store);
  }

  @override
  void onDisposeCallBack(Store<AppState> store) {}

  @override
  void onInitializeCallBack(Store<AppState> store) {}

  @override
  Widget layout(BoxConstraints cts, BuildContext ctx, LoginViewModel vm) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CurvedContainerLogo(
              cts: cts,
            ),
            SizedBox(
              height: cts.h(.1),
            ),
            LoginForm(
              onLogin: (credentials) {},
              cts: cts,
            )
          ],
        ),
      ),
    );
  }
}
