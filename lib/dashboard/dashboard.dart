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
      backgroundColor: Colors.grey[300],
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.filter_list,
          color: Colors.white,
          size: 24,
        ),
        backgroundColor: darkGrey,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                                        onChanged: vm.onSearch,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ))
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
              expandedHeight: cts.h(.2)),
          SliverToBoxAdapter(
            child: Container(color: Colors.grey[300], height: cts.h(.12)),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(color: Colors.red, height: 150.0),
                Container(color: Colors.purple, height: 150.0),
                Container(color: Colors.green, height: 150.0),
                Container(color: Colors.red, height: 150.0),
                Container(color: Colors.purple, height: 150.0),
                Container(color: Colors.green, height: 150.0),
                Container(color: Colors.red, height: 150.0),
                Container(color: Colors.purple, height: 150.0),
                Container(color: Colors.green, height: 150.0),
              ],
            ),
          )
        ],
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
