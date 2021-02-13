import 'package:base/base.dart';
import 'package:ioasys/redux/state.dart';
import 'package:redux/redux.dart';

class DashBoardViewModel extends ViewModel<AppState> {
  DashBoardViewModel(Store<AppState> store) : super(store);
}
