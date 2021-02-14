import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:ioasys/layout/colors.dart';
import 'package:ioasys/search_redux/state.dart';

class SearchAppBarView extends StatelessWidget {
  final Function searchResultText;
  final Function(String) onSearch;
  final SearchState searchState;
  final BoxConstraints cts;

  const SearchAppBarView(
      {Key key,
      this.cts,
      this.searchResultText,
      this.searchState,
      this.onSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        floating: true,
        snap: true,
        flexibleSpace: Container(
            child: Stack(
              fit: StackFit.expand,
              overflow: Overflow.visible,
              children: [
                Positioned(
                    top: cts.h(.225),
                    left: cts.w(.05),
                    right: cts.w(.05),
                    child: Column(
                      children: [
                        Card(
                          child: Container(
                            width: cts.w(.9),
                            height: cts.h(.065),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: TextField(
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.search,
                                      color: darkGrey,
                                      size: 24,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'Procure empresas',
                                  ),
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    decoration: TextDecoration.none,
                                  ),
                                  onChanged: onSearch,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: cts.h(.02),
                        ),
                        if (searchState is SearchPopulatedState)
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              children: [
                                Text(
                                  searchResultText(),
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          ),
                      ],
                    )),
              ],
            ),
            width: double.infinity,
            height: cts.h(.4),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.pink, Colors.purple]))),
        collapsedHeight: cts.h(.15),
        expandedHeight: cts.h(.2));
  }
}
