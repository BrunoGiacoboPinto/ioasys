import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:ioasys/dashboard/viewmodel.dart';
import 'package:ioasys/redux/state.dart';
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
      backgroundColor: Colors.red,
    );
  }
}
