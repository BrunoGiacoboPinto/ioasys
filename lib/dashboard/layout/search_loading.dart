import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:ioasys/loader/loader.dart';

class SearchLoadingView extends StatelessWidget {
  final BoxConstraints cts;

  const SearchLoadingView({Key key, this.cts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: cts.h(.45),
        child: Center(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            child: AnimatedLoader(
              cts: cts,
            ),
          ),
        ),
      ),
    );
  }
}
