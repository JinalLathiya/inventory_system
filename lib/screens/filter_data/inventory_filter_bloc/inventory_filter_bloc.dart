import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/database.dart';
import 'inventory_filter_event.dart';
import 'inventory_filter_state.dart';

class InventoryFilterBloc extends Bloc<InventoryFilterEvent, InventoryFilterState> {
  final database = MyDatabase.getInstance();

  InventoryFilterBloc(super.initialState) {
    on<FilterProcessorEvent>(_onFilterProcessorEvent);
    on<FilterProcessorSelectEvent>(_onFilterProcessorSelectEvent);
    on<FilterRamsEvent>(_onFilterRamsEvent);
    on<FilterRamsSelectEvent>(_onFilterRamsSelectEvent);
    on<FilterStorageEvent>(_onFilterStorageEvent);
    on<FilterStorageSelectEvent>(_onFilterStorageSelectEvent);
    on<FilterOsEvent>(_onFilterOsEvent);
    on<FilterOsSelectEvent>(_onFilterOsSelectEvent);
    on<FilterDepartmentEvent>(_onFilterDepartmentEvent);
    on<FilterDepartmentSelectEvent>(_onFilterDepartmentSelectEvent);
    on<FilterDateEvent>(_onFilterDateEvent);
    on<FilterDateSelectEvent>(_onFilterDateSelectEvent);
    on<SelectedFilterChanged>(_onSelectedFilterChanged);
    on<FilterDataEvent>(_onFilterDataEvent);
    on<ClearFilterEvent>(_onClearFilterEvent);

    database.processors.select().get().then((value) {
      add(FilterProcessorEvent(filterProcessor: value));
    });

    database.ram.select().get().then((value) {
      add(FilterRamsEvent(filterRams: value));
    });

    database.storage.select().get().then((value) {
      add(FilterStorageEvent(filterStorages: value));
    });

    database.operatingSystems.select().get().then((value) {
      add(FilterOsEvent(filterOs: value));
    });

    database.departments.select().get().then((value) {
      add(FilterDepartmentEvent(filterDepartment: value));
    });
  }

  FutureOr<void> _onFilterProcessorEvent(FilterProcessorEvent event, Emitter<InventoryFilterState> emit) {
    emit(state.copyWith(filterProcessor: event.filterProcessor));
  }

  FutureOr<void> _onFilterProcessorSelectEvent(FilterProcessorSelectEvent event, Emitter<InventoryFilterState> emit) {
    emit(state.copyWith(selectedFilterProcessor: event.filterSelectedProcessorId));
  }

  FutureOr<void> _onFilterRamsEvent(FilterRamsEvent event, Emitter<InventoryFilterState> emit) {
    emit(state.copyWith(filterRams: event.filterRams));
  }

  FutureOr<void> _onFilterRamsSelectEvent(FilterRamsSelectEvent event, Emitter<InventoryFilterState> emit) {
    emit(state.copyWith(selectedFilterRam: event.filterSelectedRamId));
  }

  FutureOr<void> _onFilterStorageEvent(FilterStorageEvent event, Emitter<InventoryFilterState> emit) {
    emit(state.copyWith(filterStorage: event.filterStorages));
  }

  FutureOr<void> _onFilterStorageSelectEvent(FilterStorageSelectEvent event, Emitter<InventoryFilterState> emit) {
    emit(state.copyWith(selectedFilterStorage: event.filterSelectedStorageId));
  }

  FutureOr<void> _onFilterOsEvent(FilterOsEvent event, Emitter<InventoryFilterState> emit) {
    emit(state.copyWith(filterOs: event.filterOs));
  }

  FutureOr<void> _onFilterOsSelectEvent(FilterOsSelectEvent event, Emitter<InventoryFilterState> emit) {
    emit(state.copyWith(selectedFilterOs: event.filterSelectedOsId));
  }

  FutureOr<void> _onFilterDepartmentEvent(FilterDepartmentEvent event, Emitter<InventoryFilterState> emit) {
    emit(state.copyWith(filterDepartments: event.filterDepartment));
  }

  FutureOr<void> _onFilterDepartmentSelectEvent(FilterDepartmentSelectEvent event, Emitter<InventoryFilterState> emit) {
    emit(state.copyWith(selectedFilterDepartments: event.filterSelectedDepartmentId));
  }

  FutureOr<void> _onSelectedFilterChanged(SelectedFilterChanged event, Emitter<InventoryFilterState> emit) {
    emit(state.copyWith(selectedFilter: event.type));
  }

  FutureOr<void> _onFilterDateEvent(FilterDateEvent event, Emitter<InventoryFilterState> emit) {
    emit(state.copyWith(dateTimeRange: DateTimeRange(start: event.startDate, end: event.endDate)));
  }

  FutureOr<void> _onFilterDateSelectEvent(FilterDateSelectEvent event, Emitter<InventoryFilterState> emit) {}

  FutureOr<void> _onFilterDataEvent(FilterDataEvent event, Emitter<InventoryFilterState> emit) {
    switch (event.filterType) {
      case FilterType.processor:
        List<int> selectedProcessorList = List.from(state.selectedFilterProcessor ?? []);
        if (selectedProcessorList.contains(event.id)) {
          selectedProcessorList.remove(event.id);
        } else {
          selectedProcessorList.add(event.id!);
        }
        emit(state.copyWith(filterProcessor: state.filterProcessor, selectedFilterProcessor: selectedProcessorList));
        break;
      case FilterType.ram:
        List<int> selectedRamList = List.from(state.selectedFilterRam ?? []);
        if (selectedRamList.contains(event.id)) {
          selectedRamList.remove(event.id);
        } else {
          selectedRamList.add(event.id!);
        }
        emit(state.copyWith(filterRams: state.filterRams, selectedFilterRam: selectedRamList));
        break;
      case FilterType.storage:
        List<int> selectedStorageList = List.from(state.selectedFilterStorage ?? []);
        if (selectedStorageList.contains(event.id)) {
          selectedStorageList.remove(event.id);
        } else {
          selectedStorageList.add(event.id!);
        }
        emit(state.copyWith(filterStorage: state.filterStorage, selectedFilterStorage: selectedStorageList));
        break;
      case FilterType.os:
        List<int> selectedOsList = List.from(state.selectedFilterOs ?? []);
        if (selectedOsList.contains(event.id)) {
          selectedOsList.remove(event.id);
        } else {
          selectedOsList.add(event.id!);
        }
        emit(state.copyWith(filterOs: state.filterOs, selectedFilterOs: selectedOsList));
        break;
      case FilterType.department:
        List<int> selectedDepartmentList = List.from(state.selectedFilterDepartments ?? []);
        if (selectedDepartmentList.contains(event.id)) {
          selectedDepartmentList.remove(event.id);
        } else {
          selectedDepartmentList.add(event.id!);
        }
        emit(state.copyWith(
            filterDepartments: state.filterDepartments, selectedFilterDepartments: selectedDepartmentList));
        break;
      default:
        null;
    }
  }

  FutureOr<void> _onClearFilterEvent(ClearFilterEvent event, Emitter<InventoryFilterState> emit) {
    emit(state.copyWith(
      selectedFilterProcessor: [],
      selectedFilterRam: [],
      selectedFilterStorage: [],
      selectedFilterOs: [],
      selectedFilterDepartments: [],
    ));
  }
}
