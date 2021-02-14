import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:ioasys/app_redux/state.dart';
import 'package:ioasys/filter/viewmodel.dart';
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

  @override
  Widget layout(BoxConstraints cts, BuildContext ctx, FilterViewModel vm) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
