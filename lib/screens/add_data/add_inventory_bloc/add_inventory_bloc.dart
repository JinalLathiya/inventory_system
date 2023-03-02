import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_system/services/database.dart';

import 'add_inventory_event.dart';
import 'add_inventory_state.dart';

class AddInventoryBloc extends Bloc<AddInventoryEvent, AddInventoryState> {
  final database = MyDatabase.getInstance();

  AddInventoryBloc(super.initialState) {
    on<ProcessorsLoadedEvent>(_onProcessorsLoadedEvent);
    on<SelectedProcessorChangeEvent>(_onSelectedProcessorChangeEvent);
    on<RamsLoadedEvent>(_onRamsLoadedEvent);
    on<SelectedRamChangeEvent>(_onSelectedRamChangeEvent);
    on<StorageLoadedEvent>(_onStorageLoadedEvent);
    on<SelectedStorageChangeEvent>(_onSelectedStorageChangeEvent);
    on<OsLoadedEvent>(_onOsLoadedEvent);
    on<SelectedOsChangeEvent>(_onSelectedOsChangeEvent);
    on<DepartmentsLoadedEvent>(_onDepartmentsLoadedEvent);
    on<SelectedDepartmentChangeEvent>(_onSelectedDepartmentChangeEvent);
    on<InsertDataEvent>(_onInsertDataEvent);
    on<DeleteDataEvent>(_onDeleteDataEvent);
    on<UpdateDataEvent>(_onUpdateDataEvent);

    database.processors.select().get().then((value) {
      add(ProcessorsLoadedEvent(processors: value));
    });

    database.ram.select().get().then((value) {
      add(RamsLoadedEvent(rams: value));
    });

    database.storage.select().get().then((value) {
      add(StorageLoadedEvent(storage: value));
    });

    database.operatingSystems.select().get().then((value) {
      add(OsLoadedEvent(operatingSystem: value));
    });

    database.departments.select().get().then((value) {
      add(DepartmentsLoadedEvent(departments: value));
    });
  }

  FutureOr<void> _onProcessorsLoadedEvent(ProcessorsLoadedEvent event, Emitter<AddInventoryState> emit) {
    emit(state.copyWith(processors: event.processors));
  }

  FutureOr<void> _onSelectedProcessorChangeEvent(SelectedProcessorChangeEvent event, Emitter<AddInventoryState> emit) {
    emit(state.copyWith(selectedProcessor: event.selectedProcessorId));
  }

  FutureOr<void> _onRamsLoadedEvent(RamsLoadedEvent event, Emitter<AddInventoryState> emit) {
    emit(state.copyWith(rams: event.rams));
  }

  FutureOr<void> _onSelectedRamChangeEvent(SelectedRamChangeEvent event, Emitter<AddInventoryState> emit) {
    emit(state.copyWith(selectedRam: event.selectedRamId));
  }

  FutureOr<void> _onStorageLoadedEvent(StorageLoadedEvent event, Emitter<AddInventoryState> emit) {
    emit(state.copyWith(storage: event.storage));
  }

  FutureOr<void> _onSelectedStorageChangeEvent(SelectedStorageChangeEvent event, Emitter<AddInventoryState> emit) {
    emit(state.copyWith(selectedStorage: event.selectedStorageId));
  }

  FutureOr<void> _onOsLoadedEvent(OsLoadedEvent event, Emitter<AddInventoryState> emit) {
    emit(state.copyWith(operatingSystem: event.operatingSystem));
  }

  FutureOr<void> _onSelectedOsChangeEvent(SelectedOsChangeEvent event, Emitter<AddInventoryState> emit) {
    emit(state.copyWith(selectedOs: event.selectedOsId));
  }

  FutureOr<void> _onDepartmentsLoadedEvent(DepartmentsLoadedEvent event, Emitter<AddInventoryState> emit) {
    emit(state.copyWith(departments: event.departments));
  }

  FutureOr<void> _onSelectedDepartmentChangeEvent(
      SelectedDepartmentChangeEvent event, Emitter<AddInventoryState> emit) {
    emit(state.copyWith(selectedDepartments: event.selectedDepartmentId));
  }

  FutureOr<void> _onInsertDataEvent(InsertDataEvent event, Emitter<AddInventoryState> emit) async {
    await database.insertData(
      event.assignToName,
      event.purchaseDate,
      state.selectedProcessor!,
      state.selectedOs!,
      state.selectedDepartments!,
      state.selectedRam!,
      state.selectedStorage!,
    );
  }

  FutureOr<void> _onDeleteDataEvent(DeleteDataEvent event, Emitter<AddInventoryState> emit) async {
    await database.deleteData(event.id);
  }

  FutureOr<void> _onUpdateDataEvent(UpdateDataEvent event, Emitter<AddInventoryState> emit) async {
    await (database.inventoryTable.update()..where((tbl) => tbl.id.equals(event.id))).write(
      InventoryTableCompanion(
        assignTo: Value(event.assignToName),
        purchaseDate: Value(event.purchaseDate),
        processorsId: Value(state.selectedProcessor!),
        ramsRange: Value(state.selectedRam!),
        storageRange: Value(state.selectedStorage!),
        osId: Value(state.selectedOs!),
        departmentId: Value(state.selectedDepartments!),
      ),
    );
  }
}

