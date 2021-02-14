import 'package:flutter/material.dart';
import 'package:ioasys/layout/colors.dart';

class LoginTextField extends StatefulWidget {
  final Function(String) onValidate;
  final Function(String) onSave;
  final BoxConstraints cts;
  final String label;

  final TextInputType inputType;

  const LoginTextField(
      {Key key,
      this.cts,
      this.label,
      this.onValidate,
      this.onSave,
      this.inputType})
      : super(key: key);

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.inputType,
      onSaved: widget.onSave,
      cursorColor: lightPink,
      cursorHeight: 24,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.close_outlined),
        labelText: widget.label,
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
      validator: widget.onValidate,
    );
  }
}
