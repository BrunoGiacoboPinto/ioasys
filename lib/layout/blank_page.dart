import 'package:flutter/material.dart';
import 'package:ioasys/login/layout/overlay_loader.dart';

class BlankPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: LayoutBuilder(
          builder: (ctx, cts) {
            return OverlayLoaderView(
              cts: cts,
            );
          },
        ),
      ),
    );
  }
}
