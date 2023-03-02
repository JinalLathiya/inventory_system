import 'package:equatable/equatable.dart';

import '../../../services/database.dart';
import 'inventory_filter_state.dart';

abstract class InventoryFilterEvent extends Equatable {
  const InventoryFilterEvent();

  @override
  List<Object?> get props => [];
}

class FilterProcessorEvent extends InventoryFilterEvent {
  final List<Processor> filterProcessor;

  const FilterProcessorEvent({
    required this.filterProcessor,
  });

  @override
  List<Object?> get props => [filterProcessor];
}

class FilterProcessorSelectEvent extends InventoryFilterEvent {
  final List<int> filterSelectedProcessorId;

  const FilterProcessorSelectEvent({
    required this.filterSelectedProcessorId,
  });

  @override
  List<Object?> get props => [filterSelectedProcessorId];
}

class FilterRamsEvent extends InventoryFilterEvent {
  final List<RamData> filterRams;

  const FilterRamsEvent({
    required this.filterRams,
  });

  @override
  List<Object?> get props => [filterRams];
}

class FilterRamsSelectEvent extends InventoryFilterEvent {
  final List<int> filterSelectedRamId;

  const FilterRamsSelectEvent({
    required this.filterSelectedRamId,
  });

  @override
  List<Object?> get props => [filterSelectedRamId];
}

class FilterStorageEvent extends InventoryFilterEvent {
  final List<StorageData> filterStorages;

  const FilterStorageEvent({
    required this.filterStorages,
  });

  @override
  List<Object?> get props => [filterStorages];
}

class FilterStorageSelectEvent extends InventoryFilterEvent {
  final List<int> filterSelectedStorageId;

  const FilterStorageSelectEvent({
    required this.filterSelectedStorageId,
  });

  @override
  List<Object?> get props => [filterSelectedStorageId];
}

class FilterOsEvent extends InventoryFilterEvent {
  final List<OperatingSystem> filterOs;

  const FilterOsEvent({
    required this.filterOs,
  });

  @override
  List<Object?> get props => [filterOs];
}

class FilterOsSelectEvent extends InventoryFilterEvent {
  final List<int> filterSelectedOsId;

  const FilterOsSelectEvent({
    required this.filterSelectedOsId,
  });

  @override
  List<Object?> get props => [filterSelectedOsId];
}

class FilterDepartmentEvent extends InventoryFilterEvent {
  final List<Department> filterDepartment;

  const FilterDepartmentEvent({
    required this.filterDepartment,
  });

  @override
  List<Object?> get props => [filterDepartment];
}

class FilterDepartmentSelectEvent extends InventoryFilterEvent {
  final List<int> filterSelectedDepartmentId;

  const FilterDepartmentSelectEvent({
    required this.filterSelectedDepartmentId,
  });

  @override
  List<Object?> get props => [filterSelectedDepartmentId];
}

class FilterDateEvent extends InventoryFilterEvent {
  final DateTime startDate;
  final DateTime endDate;

  const FilterDateEvent({
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object?> get props => [startDate, endDate];
}

class FilterDateSelectEvent extends InventoryFilterEvent {
  final bool filterSelectedDateId;

  const FilterDateSelectEvent({
    required this.filterSelectedDateId,
  });

  @override
  List<Object?> get props => [filterSelectedDateId];
}

class SelectedFilterChanged extends InventoryFilterEvent {
  final FilterType type;

  const SelectedFilterChanged({
    required this.type,
  });

  @override
  List<Object?> get props => [type];
}

class FilterDataEvent extends InventoryFilterEvent {
  final int? id;
  final FilterType? filterType;
  final DateTime? startDate;
  final DateTime? endDate;

  const FilterDataEvent({
    this.id,
    this.filterType,
    this.startDate,
    this.endDate,
  });

  @override
  List<Object?> get props => [id, filterType];
}

class ClearFilterEvent extends InventoryFilterEvent {}
