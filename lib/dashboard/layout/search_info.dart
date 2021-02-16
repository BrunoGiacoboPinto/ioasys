import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:ioasys/layout/colors.dart';

class SearchInfoView extends StatelessWidget {
  final String searchResultText;
  final String searchFilterText;
  final Function closeFilter;
  final BoxConstraints cts;
  final bool searchSucceed;

  const SearchInfoView(
      {Key key,
      this.cts,
      this.searchSucceed,
      this.searchResultText,
      this.searchFilterText,
      this.closeFilter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
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
                child: Chip(
                  deleteIcon: Icon(
                    Icons.close,
                    size: 16,
                    color: Colors.white,
                  ),
                  onDeleted: closeFilter,
                  backgroundColor: darkGrey,
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  label: Text(
                    searchFilterText ?? '',
                  ),
                ),
              )
          ],
        ),
      ),
    ));
  }
}
