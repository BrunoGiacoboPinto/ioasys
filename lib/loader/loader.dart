import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ioasys/layout/colors.dart';

class AnimatedLoader extends StatelessWidget {
  final BoxConstraints cts;

  const AnimatedLoader({Key key, this.cts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SpinKitRing(
            size: cts.h(.14),
            lineWidth: 4,
            color: lightPink,
          ),
        ),
        Center(
          child: SpinKitRing(
            size: cts.h(.11),
            lineWidth: 4,
            color: lightPink,
          ),
        )
      ],
    );
  }
}
