abstract class FilterState {}

class FilterEmptyState extends FilterState {}

class FilterSelectedState extends FilterState {
  final int id;
  final String category;

  FilterSelectedState(this.id, this.category);
}
