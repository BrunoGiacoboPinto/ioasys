import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:ioasys/layout/colors.dart';

class SearchCountView extends StatelessWidget {
  final String searchResultText;
  final BoxConstraints cts;
  final bool searchSucceed;

  const SearchCountView(
      {Key key, this.cts, this.searchSucceed, this.searchResultText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: searchSucceed
            ? Padding(
                padding: EdgeInsets.only(left: 24, top: 48),
                child: Container(
                  color: Colors.grey[300],
                  height: cts.h(.06),
                  child: Text(
                    searchResultText,
                    style: TextStyle(fontSize: 16, color: darkGrey),
                  ),
                ),
              )
            : Container());
  }
}
