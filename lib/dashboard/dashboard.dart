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
import 'layout/search_count.dart';

class DashBoardView extends View<DashBoardViewModel, AppState> {
  @override
  DashBoardViewModel createViewModel(Store<AppState> store) {
    return DashBoardViewModel(store);
  }

  @override
  void onDisposeCallBack(Store<AppState> store) {}

  @override
  void onInitializeCallBack(Store<AppState> store) {}

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget layout(BoxConstraints cts, BuildContext ctx, DashBoardViewModel vm) {
    return Scaffold(
      key: _scaffoldKey,
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
            searchState: vm.searchState,
            onSearch: vm.onSearch,
            cts: cts,
          ),
          SearchCountView(
            searchFilterText: vm.searchFilterText,
            searchSucceed: vm.searchState is SearchPopulatedState,
            searchResultText: vm.resultCountHeadline(),
            cts: cts,
          ),
          _selectViewForState(vm, cts, ctx)
        ],
      ),
    );
  }

  Widget _selectViewForState(
      DashBoardViewModel vm, BoxConstraints cts, BuildContext ctx) {
    final state = vm.searchState;

    if (state is SearchErrorState) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          duration: Duration(milliseconds: 4500), content: Text(state.reason)));
    } else if (state is SearchLoadingState) {
      return SearchLoadingView(
        cts: cts,
      );
    } else if (state is SearchEmptyState) {
      return SearchEmptyView(
        cts: cts,
      );
    } else if (state is SearchPopulatedState) {
      return SearchCompletedView(
        searched: state,
        onSelected: vm.toDetails,
        cts: cts,
      );
    }

    return SliverToBoxAdapter(child: Container());
  }
}
