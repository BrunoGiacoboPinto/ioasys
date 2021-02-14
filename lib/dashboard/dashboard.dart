import 'package:base/base.dart';
import 'package:flutter/cupertino.dart';
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
                                        onChanged: vm.onSearch,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: cts.h(.02),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Row(
                                  children: [
                                    Text(
                                      '4 empresas encontradas',
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
              expandedHeight: cts.h(.2)),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.grey[300],
              height: cts.h(.15),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: cts.w(.0125), vertical: cts.h(.0025)),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.orange,
                        height: cts.h(.2),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: cts.w(.0125), vertical: cts.h(.0025)),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.amber,
                        height: cts.h(.2),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: cts.w(.0125), vertical: cts.h(.0025)),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.purple,
                        height: cts.h(.2),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: cts.w(.0125), vertical: cts.h(.0025)),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.blueAccent,
                        height: cts.h(.2),
                      ),
                    ],
                  ),
                ),
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
