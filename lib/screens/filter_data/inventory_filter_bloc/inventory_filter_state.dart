import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:management_system/services/database.dart';

enum FilterType { processor, os, ram, storage, department, date }

class InventoryFilterState extends Equatable {
  final FilterType selectedFilter;
  final List<Processor> filterProcessor;
  List<int>? selectedFilterProcessor;
  final List<RamData> filterRams;
  List<int>? selectedFilterRam;
  final List<StorageData> filterStorage;
  List<int>? selectedFilterStorage;
  final List<OperatingSystem> filterOs;
  List<int>? selectedFilterOs;
  final List<Department> filterDepartments;
  List<int>? selectedFilterDepartments;
  final DateTimeRange? dateTimeRange;

  InventoryFilterState({
    this.selectedFilter = FilterType.processor,
    this.filterProcessor = const [],
    this.selectedFilterProcessor = const [],
    this.filterRams = const [],
    this.selectedFilterRam = const [],
    this.filterStorage = const [],
    this.selectedFilterStorage = const [],
    this.filterOs = const [],
    this.selectedFilterOs = const [],
    this.filterDepartments = const [],
    this.selectedFilterDepartments = const [],
    this.dateTimeRange,
  });

  @override
  List<Object?> get props => [
        selectedFilter,
        filterProcessor,
        selectedFilterProcessor,
        filterRams,
        selectedFilterRam,
        filterStorage,
        selectedFilterStorage,
        filterOs,
        selectedFilterOs,
        filterDepartments,
        selectedFilterDepartments,
        dateTimeRange,
      ];

  InventoryFilterState copyWith({
    FilterType? selectedFilter,
    List<Processor>? filterProcessor,
    List<int>? selectedFilterProcessor,
    List<RamData>? filterRams,
    List<int>? selectedFilterRam,
    List<StorageData>? filterStorage,
    List<int>? selectedFilterStorage,
    List<OperatingSystem>? filterOs,
    List<int>? selectedFilterOs,
    List<Department>? filterDepartments,
    List<int>? selectedFilterDepartments,
    DateTimeRange? dateTimeRange,
  }) {
    return InventoryFilterState(
      selectedFilter: selectedFilter ?? this.selectedFilter,
      filterProcessor: filterProcessor ?? this.filterProcessor,
      selectedFilterProcessor: selectedFilterProcessor ?? this.selectedFilterProcessor,
      filterRams: filterRams ?? this.filterRams,
      selectedFilterRam: selectedFilterRam ?? this.selectedFilterRam,
      filterStorage: filterStorage ?? this.filterStorage,
      selectedFilterStorage: selectedFilterStorage ?? this.selectedFilterStorage,
      filterOs: filterOs ?? this.filterOs,
      selectedFilterOs: selectedFilterOs ?? this.selectedFilterOs,
      filterDepartments: filterDepartments ?? this.filterDepartments,
      selectedFilterDepartments: selectedFilterDepartments ?? this.selectedFilterDepartments,
      dateTimeRange: dateTimeRange ?? this.dateTimeRange,
    );
  }
}

class FilterList extends Equatable {
  final List<int> selectedProcessorsIds;
  final List<int> selectedRamsIds;
  final List<int> selectedStorageIds;
  final List<int> selectedOsIds;
  final List<int> selectedDepartmentsIds;
  final DateTimeRange? selectedDateTimeRange;

  const FilterList({
    this.selectedProcessorsIds = const [],
    this.selectedRamsIds = const [],
    this.selectedStorageIds = const [],
    this.selectedOsIds = const [],
    this.selectedDepartmentsIds = const [],
    this.selectedDateTimeRange,
  });

  @override
  List<Object?> get props => [
        selectedProcessorsIds,
        selectedRamsIds,
        selectedStorageIds,
        selectedOsIds,
        selectedDepartmentsIds,
        selectedDateTimeRange,
      ];

  FilterList copyWith({
    List<int>? selectedProcessorsIds,
    List<int>? selectedRamsIds,
    List<int>? selectedStorageIds,
    List<int>? selectedOsIds,
    List<int>? selectedDepartmentsIds,
    DateTimeRange? selectedDateTimeRange,
  }) {
    return FilterList(
      selectedProcessorsIds: selectedProcessorsIds ?? this.selectedProcessorsIds,
      selectedRamsIds: selectedRamsIds ?? this.selectedRamsIds,
      selectedStorageIds: selectedStorageIds ?? this.selectedStorageIds,
      selectedOsIds: selectedOsIds ?? this.selectedOsIds,
      selectedDepartmentsIds: selectedDepartmentsIds ?? this.selectedDepartmentsIds,
      selectedDateTimeRange: selectedDateTimeRange ?? this.selectedDateTimeRange,
    );
  }
}
