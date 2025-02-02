import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:ioasys/layout/colors.dart';
import 'package:ioasys/search_redux/state.dart';

class SearchAppBarView extends StatelessWidget {
  final Function(String) onSearch;
  final SearchState searchState;
  final BoxConstraints cts;

  const SearchAppBarView({Key key, this.cts, this.searchState, this.onSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Positioned(
                top: cts.h(.16),
                left: cts.w(.03),
                right: cts.w(.03),
                child: Container(
                  width: cts.w(.9),
                  height: 70,
                  child: Card(
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
                ),
              )
            ],
          ),
          width: double.infinity,
          height: cts.h(.21),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.pink, Colors.purple]))),
    );
  }
}
