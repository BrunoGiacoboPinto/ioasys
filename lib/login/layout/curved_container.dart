import 'package:flutter/material.dart';

class CurvedContainerLogo extends StatelessWidget {
  final BoxConstraints cts;

  const CurvedContainerLogo({Key key, this.cts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: Center(
        child: Image.asset('images/logo_ioasys_white.png'),
      ),
      decoration: new BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.pink, Colors.purple]),
        borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(cts.maxWidth, 150.0)),
      ),
    );
  }
}
