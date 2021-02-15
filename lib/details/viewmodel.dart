import 'package:base/base.dart';
import 'package:ioasys/app_redux/state.dart';
import 'package:ioasys/models/enterprise_info.dart';
import 'package:ioasys/search_redux/state.dart';
import 'package:redux/redux.dart';

class DetailsViewModel extends ViewModel<AppState> {
  DetailsViewModel(Store<AppState> store) : super(store);

  EnterpriseInfo getEnterpriseById(int id) {
    final companies = (store.state.searchState as SearchPopulatedState);

    return companies.result.enterprises.firstWhere((e) => e.id == id);
  }
}
