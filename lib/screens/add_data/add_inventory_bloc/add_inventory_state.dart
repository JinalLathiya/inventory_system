import 'package:equatable/equatable.dart';
import 'package:management_system/services/database.dart';

class AddInventoryState extends Equatable {
  final List<Processor> processors;
  final int? selectedProcessor;
  final List<RamData> rams;
  final int? selectedRam;
  final List<StorageData> storage;
  final int? selectedStorage;
  final List<OperatingSystem> operatingSystem;
  final int? selectedOs;
  final List<Department> departments;
  final int? selectedDepartments;

  const AddInventoryState({
    this.processors = const [],
    this.selectedProcessor,
    this.rams = const [],
    this.selectedRam,
    this.storage = const [],
    this.selectedStorage,
    this.operatingSystem = const [],
    this.selectedOs,
    this.departments = const [],
    this.selectedDepartments,
  });

  @override
  List<Object?> get props => [
        processors,
        selectedProcessor,
        rams,
        selectedRam,
        storage,
        selectedStorage,
        operatingSystem,
        selectedOs,
        departments,
        selectedDepartments,
      ];

  AddInventoryState copyWith({
    List<Processor>? processors,
    int? selectedProcessor,
    List<RamData>? rams,
    int? selectedRam,
    List<StorageData>? storage,
    int? selectedStorage,
    List<OperatingSystem>? operatingSystem,
    int? selectedOs,
    List<Department>? departments,
    int? selectedDepartments,
  }) {
    return AddInventoryState(
      processors: processors ?? this.processors,
      selectedProcessor: selectedProcessor ?? this.selectedProcessor,
      rams: rams ?? this.rams,
      selectedRam: selectedRam ?? this.selectedRam,
      storage: storage ?? this.storage,
      selectedStorage: selectedStorage ?? this.selectedStorage,
      operatingSystem: operatingSystem ?? this.operatingSystem,
      selectedOs: selectedOs ?? this.selectedOs,
      departments: departments ?? this.departments,
      selectedDepartments: selectedDepartments ?? this.selectedDepartments,
    );
  }
}
