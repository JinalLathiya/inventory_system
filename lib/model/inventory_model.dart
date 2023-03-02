import 'package:management_system/services/database.dart';

class InventoryDetail {
  final int id;
  final Processor processor;
  final Department department;
  final RamData ram;
  final StorageData storageData;
  final OperatingSystem operatingSystem;
  final DateTime purchaseDate;
  final String assignTo;

  const InventoryDetail({
    required this.id,
    required this.processor,
    required this.department,
    required this.ram,
    required this.storageData,
    required this.operatingSystem,
    required this.purchaseDate,
    required this.assignTo,
  });
}