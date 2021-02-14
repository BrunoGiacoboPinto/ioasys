import 'package:redux/redux.dart';

import 'action.dart';
import 'state.dart';

final searchReducer = combineReducers<SearchState>([
  TypedReducer<SearchState, SearchLoadingAction>(_onLoad),
  TypedReducer<SearchState, SearchErrorAction>(_onError),
  TypedReducer<SearchState, SearchResultCompletedAction>(_onResult),
]);

SearchState _onLoad(SearchState prev, SearchLoadingAction action) =>
    SearchLoading();

SearchState _onError(SearchState prev, SearchErrorAction action) =>
    SearchError();

SearchState _onResult(SearchState prev, SearchResultCompletedAction action) =>
    SearchPopulated(action.result);
