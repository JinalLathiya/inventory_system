import 'package:equatable/equatable.dart';
import 'package:management_system/services/database.dart';

import '../../../model/inventory_model.dart';

abstract class AddInventoryEvent extends Equatable {
  const AddInventoryEvent();

  @override
  List<Object?> get props => [];
}

class ProcessorsLoadedEvent extends AddInventoryEvent {
  final List<Processor> processors;

  const ProcessorsLoadedEvent({
    required this.processors,
  });

  @override
  List<Object?> get props => [processors];
}

class SelectedProcessorChangeEvent extends AddInventoryEvent {
  final int selectedProcessorId;

  const SelectedProcessorChangeEvent({
    required this.selectedProcessorId,
  });

  @override
  List<Object?> get props => [selectedProcessorId];
}

class RamsLoadedEvent extends AddInventoryEvent {
  final List<RamData> rams;

  const RamsLoadedEvent({
    required this.rams,
  });

  @override
  List<Object?> get props => [rams];
}

class SelectedRamChangeEvent extends AddInventoryEvent {
  final int selectedRamId;

  const SelectedRamChangeEvent({
    required this.selectedRamId,
  });

  @override
  List<Object?> get props => [selectedRamId];
}

class StorageLoadedEvent extends AddInventoryEvent {
  final List<StorageData> storage;

  const StorageLoadedEvent({
    required this.storage,
  });

  @override
  List<Object?> get props => [storage];
}

class SelectedStorageChangeEvent extends AddInventoryEvent {
  final int selectedStorageId;

  const SelectedStorageChangeEvent({
    required this.selectedStorageId,
  });

  @override
  List<Object?> get props => [selectedStorageId];
}

class OsLoadedEvent extends AddInventoryEvent {
  final List<OperatingSystem> operatingSystem;

  const OsLoadedEvent({
    required this.operatingSystem,
  });

  @override
  List<Object?> get props => [operatingSystem];
}

class SelectedOsChangeEvent extends AddInventoryEvent {
  final int selectedOsId;

  const SelectedOsChangeEvent({
    required this.selectedOsId,
  });

  @override
  List<Object?> get props => [selectedOsId];
}

class DepartmentsLoadedEvent extends AddInventoryEvent {
  final List<Department> departments;

  const DepartmentsLoadedEvent({
    required this.departments,
  });

  @override
  List<Object?> get props => [departments];
}

class SelectedDepartmentChangeEvent extends AddInventoryEvent {
  final int selectedDepartmentId;

  const SelectedDepartmentChangeEvent({
    required this.selectedDepartmentId,
  });

  @override
  List<Object?> get props => [selectedDepartmentId];
}

class InsertDataEvent extends AddInventoryEvent {
  final String assignToName;
  final DateTime purchaseDate;

  const InsertDataEvent({
    required this.assignToName,
    required this.purchaseDate,
  });

  @override
  List<Object?> get props => [assignToName, purchaseDate];
}
class UpdateDataEvent extends AddInventoryEvent {
  final int id;
  final String assignToName;
  final DateTime purchaseDate;


  @override
  List<Object?> get props => [assignToName, purchaseDate, id];

  const UpdateDataEvent({
    required this.id,
    required this.assignToName,
    required this.purchaseDate,
  });
}

class DeleteDataEvent extends AddInventoryEvent {
  final int id;

  const DeleteDataEvent(this.id);

  @override
  List<Object?> get props => [id];
}
