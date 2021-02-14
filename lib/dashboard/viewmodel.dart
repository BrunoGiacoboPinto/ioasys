import 'package:base/base.dart';
import 'package:ioasys/redux/state.dart';
import 'package:ioasys/search/action.dart';
import 'package:ioasys/search/state.dart';
import 'package:redux/redux.dart';

class DashBoardViewModel extends ViewModel<AppState> {
  DashBoardViewModel(Store<AppState> store) : super(store);

  SearchState get searchState => store.state.searchState;

  void onSearch(String name) {
    logger.d('I should not call if ${name.isEmpty}');
    store.dispatch(name.isEmpty ? SearchEmpty() : SearchAction(name));
  }
}
