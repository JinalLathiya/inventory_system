import 'package:equatable/equatable.dart';
import 'package:management_system/model/inventory_model.dart';
import 'package:management_system/screens/filter_data/inventory_filter_bloc/inventory_filter_state.dart';

abstract class InventoriesEvent extends Equatable {
  const InventoriesEvent();

  @override
  List<Object?> get props => [];
}

class InventoryDataUpdated extends InventoriesEvent {
  final List<InventoryDetail> inventoryDetails;

  const InventoryDataUpdated({required this.inventoryDetails});

  @override
  List<Object?> get props => [inventoryDetails];
}

class FilterUpdatedEvent extends InventoriesEvent {
  final FilterList filter;

  const FilterUpdatedEvent({
    required this.filter,
  });

  @override
  List<Object?> get props => [filter];
}

class SearchedDataEvent extends InventoriesEvent {
  final String searchedText;

  const SearchedDataEvent({
    required this.searchedText,
  });

  @override
  List<Object?> get props => [searchedText];
}

class GroupListEvent extends InventoriesEvent {}
