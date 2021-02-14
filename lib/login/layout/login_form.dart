import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:ioasys/layout/colors.dart';
import 'package:ioasys/login/layout/login_textfield.dart';

class LoginForm extends StatelessWidget {
  final Function(Map<String, dynamic>) onLogin;
  final BoxConstraints cts;

  final _formKey = GlobalKey<FormState>();

  LoginForm({Key key, this.onLogin, this.cts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: cts.w(.9),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            LoginTextField(
              label: 'E-mail',
              cts: cts,
            ),
            SizedBox(
              height: cts.h(.05),
            ),
            LoginTextField(
              label: 'Senha',
              cts: cts,
            ),
            SizedBox(
              height: cts.h(.05),
            ),
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Container(
                  width: cts.w(.9),
                  height: cts.h(.075),
                  child: Center(
                    child: Text(
                      'ENTRAR',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                textColor: Colors.white,
                color: lightPink,
                onPressed: () {
                  print('___ Called');
                })
          ],
        ),
      ),
    ));
  }
}
