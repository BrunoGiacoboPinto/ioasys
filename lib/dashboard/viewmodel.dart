import 'package:base/base.dart';
import 'package:ioasys/app_redux/state.dart';
import 'package:ioasys/search_redux/action.dart';
import 'package:ioasys/search_redux/state.dart';
import 'package:redux/redux.dart';

class DashBoardViewModel extends ViewModel<AppState> {
  DashBoardViewModel(Store<AppState> store) : super(store);

  SearchState get searchState => store.state.searchState;

  void onSearch(String name) {
    store.dispatch(SearchAction(name));
  }

  String resultCountHeadline() {
    final companies = searchState as SearchPopulatedState;
    int count = companies.result.enterprises.length;

    return "Encontramos $count empresa${count == 1 ? '' : 's'}";
  }

  void toDetails(int id) {
    store.dispatch(NavigateToWithArgs('/details', {'id': id}));
  }

  void toFilter() {
    store.dispatch(NavigateToAction('/filter'));
  }
}
