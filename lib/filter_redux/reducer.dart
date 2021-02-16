import 'package:ioasys/filter_redux/action.dart';
import 'package:ioasys/filter_redux/state.dart';
import 'package:redux/redux.dart';

final filterReducer = combineReducers<FilterState>([
  TypedReducer<FilterState, EmptyFilterAction>(_onEmpty),
  TypedReducer<FilterState, SelectFilterAction>(_onSelected)
]);

FilterState _onEmpty(FilterState prev, EmptyFilterAction action) =>
    FilterEmptyState();

FilterState _onSelected(FilterState prev, SelectFilterAction action) =>
    FilterSelectedState(action.id, action.category);
