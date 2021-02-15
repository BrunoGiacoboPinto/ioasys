import 'package:flutter/material.dart';
import 'package:ioasys/layout/colors.dart';

class LoginPasswordTextField extends StatefulWidget {
  final Function(String) onSave;
  final BoxConstraints cts;

  const LoginPasswordTextField({
    Key key,
    this.onSave,
    this.cts,
  }) : super(key: key);

  @override
  _LoginPasswordTextFieldState createState() => _LoginPasswordTextFieldState();
}

class _LoginPasswordTextFieldState extends State<LoginPasswordTextField> {
  bool _error = false;

  String _validatePasswordInput(String value) {
    if (value.isEmpty) {
      setState(() {
        _error = true;
      });
      return 'Preencha sua senha numérica';
    }

    if (value.length < 6) {
      setState(() {
        _error = true;
      });
      return 'A senha deve ter 8 digitos';
    }

    return null;
  }

  bool _ofuscate = true;

  Widget _suffixIcon() {
    return _error
        ? Icon(
            Icons.error,
            size: 24,
            color: darkRed,
          )
        : IconButton(
            icon: Icon(
              _ofuscate ? Icons.visibility_off : Icons.visibility,
              size: 24,
              color: darkGrey,
            ),
            onPressed: () {
              setState(() {
                _ofuscate = !_ofuscate;
              });
            });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 8,
      keyboardType: TextInputType.number,
      onSaved: widget.onSave,
      cursorColor: lightPink,
      cursorHeight: 24,
      obscureText: _ofuscate,
      decoration: InputDecoration(
        suffixIcon: _suffixIcon(),
        labelText: 'Senha',
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
      validator: _validatePasswordInput,
    );
  }
}
