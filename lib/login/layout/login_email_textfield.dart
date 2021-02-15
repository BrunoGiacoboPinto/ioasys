import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:ioasys/layout/colors.dart';

class LoginEmailTextField extends StatefulWidget {
  final Function(String) onSave;
  final BoxConstraints cts;

  const LoginEmailTextField({
    Key key,
    this.onSave,
    this.cts,
  }) : super(key: key);

  @override
  _LoginEmailTextFieldState createState() => _LoginEmailTextFieldState();
}

class _LoginEmailTextFieldState extends State<LoginEmailTextField> {
  bool _error = false;

  String _validateEmailInput(String value) {
    if (value.isEmpty) {
      setState(() {
        _error = true;
      });
      return 'Preencha seu endereço de e-mail';
    }

    if (!EmailValidator.validate(value)) {
      _error = true;
      return 'Endereço de e-mail inválido.';
    }

    return null;
  }

  Widget _suffixIcon() {
    return _error
        ? Icon(
            Icons.error,
            size: 24,
            color: darkRed,
          )
        : SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: widget.onSave,
      cursorColor: lightPink,
      cursorHeight: 24,
      decoration: InputDecoration(
        suffixIcon: _suffixIcon(),
        labelText: 'E-mail',
        labelStyle: TextStyle(color: darkGrey, fontSize: 16),
        filled: true,
        fillColor: lightGrey,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.transparent,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: darkGrey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: darkRed,
          ),
        ),
      ),
      validator: _validateEmailInput,
    );
  }
}
