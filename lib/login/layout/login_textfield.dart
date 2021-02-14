import 'package:flutter/material.dart';
import 'package:ioasys/layout/colors.dart';

class LoginTextField extends StatefulWidget {
  final BoxConstraints cts;
  final String label;

  const LoginTextField({Key key, this.cts, this.label}) : super(key: key);

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
