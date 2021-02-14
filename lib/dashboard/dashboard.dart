import 'package:base/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ioasys/app_redux/state.dart';
import 'package:ioasys/dashboard/layout/search_completed.dart';
import 'package:ioasys/dashboard/layout/search_empty.dart';
import 'package:ioasys/dashboard/layout/search_loading.dart';
import 'package:ioasys/dashboard/viewmodel.dart';
import 'package:ioasys/layout/colors.dart';
import 'package:ioasys/search_redux/state.dart';
import 'package:redux/redux.dart';

import 'layout/search_appbar.dart';

class DashBoardView extends View<DashBoardViewModel, AppState> {
  @override
  DashBoardViewModel createViewModel(Store<AppState> store) {
    return DashBoardViewModel(store);
  }

  @override
  void onDisposeCallBack(Store<AppState> store) {}

  @override
  void onInitializeCallBack(Store<AppState> store) {}

  @override
  Widget layout(BoxConstraints cts, BuildContext ctx, DashBoardViewModel vm) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: vm.toFilter,
        child: Icon(
          Icons.filter_list,
          color: Colors.white,
          size: 24,
        ),
        backgroundColor: darkGrey,
      ),
      body: CustomScrollView(
        slivers: [
          SearchAppBarView(
            searchResultText: vm.resultCountHeadline,
            searchState: vm.searchState,
            onSearch: vm.onSearch,
            cts: cts,
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.grey[300],
              height: cts.h(.15),
            ),
          ),
          _selectViewForState(vm, cts)
        ],
      ),
    );
  }

  Widget _selectViewForState(DashBoardViewModel vm, BoxConstraints cts) {
    if (vm.searchState is SearchLoadingState) {
      return SearchLoadingView(
        cts: cts,
      );
    } else if (vm.searchState is SearchEmptyState) {
      return SearchEmptyView(
        cts: cts,
      );
    } else if (vm.searchState is SearchPopulatedState) {
      return SearchCompletedView(
        searched: vm.searchState,
        onSelected: vm.toDetails,
        cts: cts,
      );
    }

    return SliverToBoxAdapter(child: Container());
  }
}
