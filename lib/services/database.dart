import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:management_system/model/inventory_model.dart';
import 'package:management_system/screens/filter_data/inventory_filter_bloc/inventory_filter_state.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DataClassName("InventoryData")
class InventoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get processorsId => integer().references(Processors, #id)();

  IntColumn get ramsRange => integer().references(Ram, #id)();

  IntColumn get osId => integer().references(OperatingSystems, #id)();

  IntColumn get storageRange => integer().references(Storage, #id)();

  IntColumn get departmentId => integer().references(Departments, #id)();

  DateTimeColumn get purchaseDate => dateTime()();

  TextColumn get assignTo => text()();
}

class Processors extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
}

class Ram extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get ramFrom => integer()();

  IntColumn get ramTo => integer()();
}

class OperatingSystems extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
}

class Storage extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get storageFrom => integer()();

  IntColumn get storageTo => integer()();
}

class Departments extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [InventoryTable, Processors, Ram, Storage, OperatingSystems, Departments])
class MyDatabase extends _$MyDatabase {
  MyDatabase(super.e);

  static MyDatabase? _instance;

  factory MyDatabase.getInstance() {
    return _instance ??= MyDatabase(_openConnection());
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await batch((batch) {
            return batch.insertAll(
              processors,
              [
                const ProcessorsCompanion(name: Value("Intel")),
                const ProcessorsCompanion(name: Value("AMD")),
                const ProcessorsCompanion(name: Value("Apple Silicon")),
              ],
            );
          });
          await batch((batch) {
            return batch.insertAll(
              ram,
              [
                const RamCompanion(ramFrom: Value(0), ramTo: Value(4)),
                const RamCompanion(ramFrom: Value(4), ramTo: Value(8)),
                const RamCompanion(ramFrom: Value(8), ramTo: Value(12)),
                const RamCompanion(ramFrom: Value(12), ramTo: Value(16)),
              ],
            );
          });
          await batch((batch) {
            return batch.insertAll(operatingSystems, [
              const OperatingSystemsCompanion(name: Value("Mac")),
              const OperatingSystemsCompanion(name: Value("Windows")),
              const OperatingSystemsCompanion(name: Value("Linux")),
              const OperatingSystemsCompanion(name: Value("Ubuntu")),
            ]);
          });
          await batch((batch) {
            return batch.insertAll(storage, [
              const StorageCompanion(storageFrom: Value(16), storageTo: Value(32)),
              const StorageCompanion(storageFrom: Value(32), storageTo: Value(64)),
              const StorageCompanion(storageFrom: Value(64), storageTo: Value(120)),
              const StorageCompanion(storageFrom: Value(120), storageTo: Value(256)),
              const StorageCompanion(storageFrom: Value(256), storageTo: Value(512)),
            ]);
          });
          await batch((batch) {
            return batch.insertAll(departments, [
              const DepartmentsCompanion(name: Value("Flutter")),
              const DepartmentsCompanion(name: Value("Android")),
              const DepartmentsCompanion(name: Value("IOS")),
              const DepartmentsCompanion(name: Value("PHP")),
              const DepartmentsCompanion(name: Value("Node JS")),
            ]);
          });
        },
      );

  Stream<List<InventoryDetail>> getInventoryDetails([FilterList? filter, String? searchText]) {
    final query = select(inventoryTable);
    if (filter != null) {
      query.where((tbl) {
        Expression<bool> queryResult = const Constant(true);
        if (filter.selectedProcessorsIds.isNotEmpty) {
          queryResult = queryResult & tbl.processorsId.isIn(filter.selectedProcessorsIds);
        }
        if (filter.selectedRamsIds.isNotEmpty) {
          queryResult = queryResult & tbl.ramsRange.isIn(filter.selectedRamsIds);
        }
        if (filter.selectedStorageIds.isNotEmpty) {
          queryResult = queryResult & tbl.storageRange.isIn(filter.selectedStorageIds);
        }
        if (filter.selectedOsIds.isNotEmpty) {
          queryResult = queryResult & tbl.osId.isIn(filter.selectedOsIds);
        }
        if (filter.selectedDepartmentsIds.isNotEmpty) {
          queryResult = queryResult & tbl.processorsId.isIn(filter.selectedDepartmentsIds);
        }
        if (filter.selectedDateTimeRange != null) {
          queryResult = queryResult &
              tbl.purchaseDate.isBiggerOrEqualValue(filter.selectedDateTimeRange?.start ?? DateTime.now()) &
              tbl.purchaseDate.isSmallerOrEqualValue(filter.selectedDateTimeRange?.end ?? DateTime.now());
        }
        return queryResult;
      });
    }

    final joinQuery = query.join([
      leftOuterJoin(processors, processors.id.equalsExp(inventoryTable.processorsId)),
      leftOuterJoin(ram, ram.id.equalsExp(inventoryTable.ramsRange)),
      leftOuterJoin(operatingSystems, operatingSystems.id.equalsExp(inventoryTable.osId)),
      leftOuterJoin(storage, storage.id.equalsExp(inventoryTable.storageRange)),
      leftOuterJoin(departments, departments.id.equalsExp(inventoryTable.departmentId)),
    ]);

    if (searchText != null && searchText.isNotEmpty) {
      joinQuery.where(inventoryTable.assignTo.like("%$searchText%") |
          processors.name.like("%$searchText%") |
          departments.name.like("%$searchText%") |
          operatingSystems.name.like("%$searchText%"));
    }

    return joinQuery.map((data) {
      return InventoryDetail(
        id: data.readTable(inventoryTable).id,
        processor: data.readTable(processors),
        department: data.readTable(departments),
        ram: data.readTable(ram),
        storageData: data.readTable(storage),
        operatingSystem: data.readTable(operatingSystems),
        purchaseDate: data.readTable(inventoryTable).purchaseDate,
        assignTo: data.readTable(inventoryTable).assignTo,
      );
    }).watch();
  }

  //INSERT INVENTORY DATA
  Future<InventoryData> insertData(String assignTo, DateTime purchaseDate, int processorsName, int osName,
      int departmentName, int ram, int storage) async {
    final id = await into(inventoryTable).insert(
      InventoryTableCompanion(
        processorsId: Value(processorsName),
        purchaseDate: Value(purchaseDate),
        assignTo: Value(assignTo),
        departmentId: Value(departmentName),
        osId: Value(osName),
        ramsRange: Value(ram),
        storageRange: Value(storage),
      ),
    );
    return await (select(inventoryTable)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  //DELETE INVENTORY DATA
  Future<int> deleteData(int id) async {
    return await (delete(inventoryTable)..where((tbl) => tbl.id.equals(id))).go();
  }
}
