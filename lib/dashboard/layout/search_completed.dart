import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:ioasys/search_redux/state.dart';

class SearchCompletedView extends StatelessWidget {
  final SearchPopulatedState searched;
  final Function(int) onSelected;
  final BoxConstraints cts;

  const SearchCompletedView({Key key, this.cts, this.onSelected, this.searched})
      : super(key: key);

  List<Widget> searchedCompaniesAsView() => searched.result.enterprises
      .map((company) => GestureDetector(
              child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: cts.w(.0125), vertical: cts.h(.0025)),
            child: Column(
              children: [
                Container(
                  color: Colors.orange,
                  height: cts.h(.2),
                  child: Center(
                    child: Text(company.enterprise_name),
                  ),
                ),
              ],
            ),
          )))
      .toList();

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate(searchedCompaniesAsView()));
  }
}
