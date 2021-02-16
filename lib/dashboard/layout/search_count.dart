import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:ioasys/layout/colors.dart';

class SearchCountView extends StatelessWidget {
  final String searchResultText;
  final String searchFilterText;
  final BoxConstraints cts;
  final bool searchSucceed;

  const SearchCountView(
      {Key key,
      this.cts,
      this.searchSucceed,
      this.searchResultText,
      this.searchFilterText})
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
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          searchResultText,
                          style: TextStyle(fontSize: 16, color: darkGrey),
                        ),
                      ),
                      if (searchFilterText != null)
                        Expanded(
                          flex: 1,
                          child: ChoiceChip(
                            selectedColor: darkGrey,
                            backgroundColor: darkGrey,
                            label: Text(
                              searchFilterText,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            selected: true,
                          ),
                        )
                    ],
                  ),
                ),
              )
            : Container());
  }
}
