import 'package:flutter/material.dart';
import 'package:ioasys/loader/loader.dart';

class OverlayLoaderView extends StatelessWidget {
  final BoxConstraints cts;

  const OverlayLoaderView({Key key, this.cts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Opacity(
          opacity: .6,
          child: Container(
            color: Colors.black,
            child: Center(
              child: AnimatedLoader(
                cts: cts,
              ),
            ),
          ),
        ),
        onWillPop: () async => false);
  }
}
