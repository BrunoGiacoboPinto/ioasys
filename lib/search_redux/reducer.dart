import 'package:redux/redux.dart';

import 'action.dart';
import 'state.dart';

final searchReducer = combineReducers<SearchState>([
  TypedReducer<SearchState, SearchLoadingAction>(_onLoad),
  TypedReducer<SearchState, SearchErrorAction>(_onError),
  TypedReducer<SearchState, SearchResultCompletedAction>(_onResult),
  TypedReducer<SearchState, SearchResetAction>(_onReset),
  TypedReducer<SearchState, SearchEmptyAction>(_onEmpty),
]);

SearchState _onLoad(SearchState prev, SearchLoadingAction action) =>
    SearchLoadingState();

SearchState _onError(SearchState prev, SearchErrorAction action) =>
    SearchErrorState(action.reason);

SearchState _onReset(SearchState prev, SearchResetAction action) =>
    SearchInitialSate();

SearchState _onEmpty(SearchState prev, SearchEmptyAction action) =>
    SearchEmptyState();

SearchState _onResult(SearchState prev, SearchResultCompletedAction action) =>
    SearchPopulatedState(action.result);
