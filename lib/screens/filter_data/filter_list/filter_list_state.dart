import 'package:equatable/equatable.dart';

class FilterItem extends Equatable {
  final int id;

  final String label;

  final bool isSelected;

  const FilterItem({
    required this.id,
    required this.label,
    required this.isSelected,
  });

  @override
  List<Object?> get props => [id, label, isSelected];

  FilterItem copyWith({
    int? id,
    String? label,
    bool? isSelected,
  }) {
    return FilterItem(
      id: id ?? this.id,
      label: label ?? this.label,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class FilterListState extends Equatable{
  final List<FilterItem> items;

  const FilterListState({
    required this.items,
  });

  @override
  List<Object?> get props => [items];

  FilterListState copyWith({
    List<FilterItem>? items,
  }) {
    return FilterListState(
      items: items ?? this.items,
    );
  }
}