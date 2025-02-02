import 'package:ioasys/models/enterprise_list.dart';

abstract class SearchState {}

class SearchInitialSate implements SearchState {}

class SearchLoadingState implements SearchState {}

class SearchEmptyState implements SearchState {}

class SearchErrorState implements SearchState {
  final String reason;

  SearchErrorState(this.reason);
}

class SearchPopulatedState implements SearchState {
  final EnterpriseInfoList result;

  SearchPopulatedState(this.result);
}
