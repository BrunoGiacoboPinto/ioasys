import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:ioasys/app_redux/state.dart';
import 'package:ioasys/dashboard/viewmodel.dart';
import 'package:ioasys/layout/colors.dart';
import 'package:ioasys/loader/loader.dart';
import 'package:ioasys/search_redux/state.dart';
import 'package:redux/redux.dart';

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
      backgroundColor: midGrey,
      body: SafeArea(
        child: Flex(direction: Axis.vertical, children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search ...',
              ),
              style: TextStyle(
                fontSize: 24.0,
                decoration: TextDecoration.none,
              ),
              onChanged: vm.onSearch,
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: _viewFor(vm.searchState, cts),
            ),
          )
        ]),
      ),
    );
  }

  Widget _viewFor(SearchState state, BoxConstraints cts) {
    if (state is SearchLoading) {
      return Center(
        child: AnimatedLoader(
          cts: cts,
        ),
      );
    } else if (state is SearchEmpty) {
      return Center(
        child: Text('Nenhuma empresa encontrada'),
      );
    } else if (state is SearchPopulated) {
      final companies = state.result.enterprises;

      return Center(
          child: ListView.builder(
              itemCount: companies.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                          'Comapny(${companies[index].id}) = ${companies[index].enterprise_name}')
                    ],
                  ),
                );
              }));
    }
  }
}
