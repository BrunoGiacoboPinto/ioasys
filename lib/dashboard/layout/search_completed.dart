import 'package:flutter/material.dart';
import 'package:ioasys/layout/enterprise_entry_item.dart';
import 'package:ioasys/search_redux/state.dart';

class SearchCompletedView extends StatelessWidget {
  final SearchPopulatedState searched;
  final Function(int) onSelected;
  final BoxConstraints cts;

  const SearchCompletedView({Key key, this.cts, this.onSelected, this.searched})
      : super(key: key);

  List<Widget> searchedCompaniesAsView() => searched.result.enterprises
      .map((company) => Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: EnterpriseEntryItemView(
              company: company,
              details: onSelected,
              cts: cts,
            ),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate(searchedCompaniesAsView()));
  }
}
