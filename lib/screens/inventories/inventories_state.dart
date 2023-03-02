import 'package:equatable/equatable.dart';
import 'package:management_system/model/inventory_model.dart';
import 'package:management_system/screens/filter_data/inventory_filter_bloc/inventory_filter_state.dart';

import '../../services/database.dart';

class InventoriesState extends Equatable {
  final List<InventoryDetail> inventoryDetails;
  final FilterList? filterList;
  final List<Processor> groupFilterProcessor;
  final List<RamData> groupFilterRams;
  final List<StorageData> groupFilterStorage;
  final List<OperatingSystem> groupFilterOs;
  final List<Department> groupFilterDepartments;

  const InventoriesState({
    this.inventoryDetails = const [],
    this.filterList,
    this.groupFilterProcessor = const [],
    this.groupFilterRams = const [],
    this.groupFilterStorage = const [],
    this.groupFilterOs = const [],
    this.groupFilterDepartments = const [],
  });

  @override
  List<Object?> get props => [
        inventoryDetails,
        filterList,
        groupFilterProcessor,
        groupFilterRams,
        groupFilterStorage,
        groupFilterOs,
        groupFilterDepartments
      ];

  InventoriesState copyWith({
    List<InventoryDetail>? inventoryDetails,
    FilterList? filterList,
    List<Processor>? groupFilterProcessor,
    List<RamData>? groupFilterRams,
    List<StorageData>? groupFilterStorage,
    List<OperatingSystem>? groupFilterOs,
    List<Department>? groupFilterDepartments,
  }) {
    return InventoriesState(
      inventoryDetails: inventoryDetails ?? this.inventoryDetails,
      filterList: filterList ?? this.filterList,
      groupFilterProcessor: groupFilterProcessor ?? this.groupFilterProcessor,
      groupFilterRams: groupFilterRams ?? this.groupFilterRams,
      groupFilterStorage: groupFilterStorage ?? this.groupFilterStorage,
      groupFilterOs: groupFilterOs ?? this.groupFilterOs,
      groupFilterDepartments: groupFilterDepartments ?? this.groupFilterDepartments,
    );
  }
}
