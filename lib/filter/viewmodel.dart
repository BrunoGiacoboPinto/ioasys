import 'package:base/base.dart';
import 'package:ioasys/app_redux/state.dart';
import 'package:redux/redux.dart';

class FilterViewModel extends ViewModel<AppState> {
  FilterViewModel(Store<AppState> store) : super(store);
}
