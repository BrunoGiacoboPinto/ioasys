library base;

import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'state.dart';
import 'viewmodel.dart';

abstract class View<T extends ViewModel, S extends BaseState>
    extends StatelessWidget {
  T createViewModel(Store<S> store);

  void onDisposeCallBack(Store<S> store);

  void onInitializeCallBack(Store<S> store);

  Widget layout(BoxConstraints cts, BuildContext ctx, T vm);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<S, T>(
      builder: (context, vm) {
        return LayoutBuilder(
          builder: (ctx, cts) => layout(cts, ctx, vm),
        );
      },
      distinct: true,
      converter: createViewModel,
      onInit: onInitializeCallBack,
      onDispose: onDisposeCallBack,
    );
  }
}
