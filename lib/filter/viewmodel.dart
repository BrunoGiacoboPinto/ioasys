import 'package:base/base.dart';
import 'package:ioasys/app_redux/state.dart';
import 'package:redux/redux.dart';

class FilterViewModel extends ViewModel<AppState> {
  FilterViewModel(Store<AppState> store) : super(store);

  void applyFilterFor(int id, String category) {
    store.dispatch(NavigatePopAction());
  }
}
