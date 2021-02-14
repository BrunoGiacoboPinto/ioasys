import 'package:flutter/material.dart';
import 'package:ioasys/layout/colors.dart';

class SearchEmptyView extends StatelessWidget {
  final BoxConstraints cts;

  const SearchEmptyView({Key key, this.cts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 400),
        child: Center(
          child: Text(
            'Nenum resultado encontrado',
            style: TextStyle(fontSize: 18, color: darkGrey),
          ),
        ),
      ),
    );
  }
}
