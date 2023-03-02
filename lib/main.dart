import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_system/model/inventory_model.dart';
import 'package:management_system/screens/add_data/add_inventory_bloc/add_inventory_bloc.dart';
import 'package:management_system/screens/add_data/add_inventory_bloc/add_inventory_state.dart';
import 'package:management_system/screens/add_data/add_page.dart';
import 'package:management_system/screens/filter_data/filter_page.dart';
import 'package:management_system/screens/filter_data/inventory_filter_bloc/inventory_filter_bloc.dart';
import 'package:management_system/screens/filter_data/inventory_filter_bloc/inventory_filter_state.dart';
import 'package:management_system/screens/group_list.dart';
import 'package:management_system/screens/home_page.dart';
import 'package:management_system/screens/inventories/inventories_bloc.dart';
import 'package:management_system/screens/inventories/inventories_state.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) {
          return BlocProvider(
            create: (context) => InventoriesBloc(const InventoriesState()),
            child: const HomePage(),
          );
        },
        "/add_page": (context) {
          final InventoryDetail? inventoryData = ModalRoute.of(context)?.settings.arguments as InventoryDetail?;

          final state = inventoryData == null
              ? const AddInventoryState()
              : AddInventoryState(
                  selectedProcessor: inventoryData.processor.id,
                  processors: [inventoryData.processor],
                  selectedRam: inventoryData.ram.id,
                  rams: [inventoryData.ram],
                  selectedStorage: inventoryData.storageData.id,
                  storage: [inventoryData.storageData],
                  selectedOs: inventoryData.operatingSystem.id,
                  operatingSystem: [inventoryData.operatingSystem],
                  selectedDepartments: inventoryData.department.id,
                  departments: [inventoryData.department],
                );
          return BlocProvider(
            create: (context) => AddInventoryBloc(state),
            child: AddPage(inventoryData: inventoryData),
          );
        },
        "/filter_page": (context) => BlocProvider(
              create: (context) => InventoryFilterBloc(InventoryFilterState()),
              child: const FilterPage(),
            ),
        "/group_list_page": (context) =>  GroupListPage(argument: ModalRoute.of(context)?.settings.arguments as InventoryGroupArgument),
      },
    );
  }
}
