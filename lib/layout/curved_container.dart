import 'package:flutter/material.dart';

class CurvedContainer extends StatelessWidget {
  final BoxConstraints cts;

  const CurvedContainer({Key key, this.cts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: new BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(cts.maxWidth, 150.0)),
      ),
    );
  }
}
