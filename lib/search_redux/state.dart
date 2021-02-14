import 'package:ioasys/models/enterprise_list.dart';

abstract class SearchState {}

class SearchInitial implements SearchState {}

class SearchLoading implements SearchState {}

class SearchEmpty implements SearchState {}

class SearchError implements SearchState {}

class SearchPopulated implements SearchState {
  final EnterpriseInfoList result;

  SearchPopulated(this.result);
}
