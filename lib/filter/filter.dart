import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:ioasys/app_redux/state.dart';
import 'package:ioasys/filter/layout/filter_options.dart';
import 'package:ioasys/filter/viewmodel.dart';
import 'package:ioasys/layout/colors.dart';
import 'package:redux/redux.dart';

class FilterView extends View<FilterViewModel, AppState> {
  @override
  FilterViewModel createViewModel(Store<AppState> store) {
    return FilterViewModel(store);
  }

  @override
  void onDisposeCallBack(Store<AppState> store) {}

  @override
  void onInitializeCallBack(Store<AppState> store) {}

  String _category;
  int _id;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget layout(BoxConstraints cts, BuildContext ctx, FilterViewModel vm) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: Container(
        width: double.infinity,
        height: cts.h(.15),
        child: Center(
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Container(
                width: cts.w(.8),
                height: cts.h(.075),
                child: Center(
                  child: Text(
                    'APLICAR FILTRO',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              textColor: Colors.white,
              color: lightPink,
              onPressed: () {
                if (_id != null) {
                  vm.applyFilterFor(_id, _category);
                } else {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('You must select one category.'),
                    duration: Duration(milliseconds: 2500),
                  ));
                }
              }),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Filtrar',
          style: TextStyle(fontSize: 24, color: darkGrey),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.close_outlined,
            color: darkGrey,
            size: 24,
          ),
          onPressed: () => Navigator.of(ctx).pop(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: cts.w(.9),
            child: Column(
              children: [
                SizedBox(
                  height: cts.h(.025),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        'Selecione uma categoria:',
                        style: TextStyle(fontSize: 24, color: darkGrey),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: cts.h(.025)),
                  child: Container(
                    width: cts.w(.9),
                    height: 1,
                    color: darkGrey,
                  ),
                ),
                Expanded(
                  child: FilterOptionsList(
                    selected: (id, category) {
                      _category = category;
                      _id = id;
                    },
                    cts: cts,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
