library base;

import 'package:base/src/state.dart';
import 'package:redux/redux.dart';

abstract class ViewModel<S extends BaseState> {
  final Store<S> store;

  ViewModel(this.store);
}
