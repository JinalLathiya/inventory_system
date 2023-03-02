import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:management_system/model/inventory_model.dart';

import 'home_page.dart';
import 'inventories/inventories_bloc.dart';
import 'inventories/inventories_state.dart';

enum GroupType { processor, operatingSystem, ram, storage, department }

class InventoryGroupArgument {
  final GroupType type;
  final List<InventoryDetail> data;

  const InventoryGroupArgument({
    required this.type,
    required this.data,
  });
}

class GroupListPage extends StatefulWidget {
  final InventoryGroupArgument argument;

  const GroupListPage({Key? key, required this.argument}) : super(key: key);

  @override
  State<GroupListPage> createState() => _GroupListPageState();
}

class _GroupListPageState extends State<GroupListPage> {
  Map<String, List<InventoryDetail>> data = {};

  @override
  void initState() {
    _filterData();
    super.initState();
  }

  void _filterData() {
    final String Function(InventoryDetail detail) selector;
    switch (widget.argument.type) {
      case GroupType.processor:
        selector = (detail) => detail.processor.name;
        break;
      case GroupType.operatingSystem:
        selector = (detail) => detail.operatingSystem.name;
        break;
      case GroupType.ram:
        selector = (detail)  => "${detail.ram.ramFrom.toString()} - ${detail.ram.ramTo.toString()}";

        break;
      case GroupType.storage:
        selector = (detail) => "${detail.storageData.storageFrom.toString()} - ${detail.storageData.storageTo.toString()}";
        break;
      case GroupType.department:
        selector = (detail) => detail.department.name;
        break;
    }

    for (final detail in widget.argument.data) {
      final key = selector(detail);
      final list = data[key] ?? [];
      list.add(detail);
      data[key] = list;
    }
  }

  @override
  Widget build(BuildContext context) {
    final keys = data.keys;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.argument.type.name),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView.builder(
        itemCount: keys.length,
        itemBuilder: (context, index) {
          final key = keys.elementAt(index);
          final list = data[key] ?? [];
          return Column(
            children: [
              ListTile(
                title: Text(key.toString()),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  final data = list[i];
                  return InventoryItem(detail: data);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
