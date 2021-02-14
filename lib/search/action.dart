import 'package:ioasys/models/enterprise_list.dart';

class SearchAction {
  final String name;

  SearchAction(this.name);
}

class SearchLoadingAction {}

class SearchErrorAction {}

class SearchResultCompletedAction {
  final EnterpriseInfoList result;

  SearchResultCompletedAction(this.result);
}
