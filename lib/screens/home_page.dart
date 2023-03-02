import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:management_system/model/inventory_model.dart';
import 'package:management_system/screens/group_list.dart';
import 'package:management_system/screens/inventories/inventories_event.dart';
import 'package:management_system/widgets/comman_text_field.dart';

import 'filter_data/inventory_filter_bloc/inventory_filter_state.dart';
import 'inventories/inventories_bloc.dart';
import 'inventories/inventories_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventory Management System"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () async {
              final result = await Navigator.pushNamed(context, "/filter_page");
              if (result is FilterList && mounted) {
                context
                    .read<InventoriesBloc>()
                    .add(FilterUpdatedEvent(filter: result));
              }
            },
            icon: const Icon(
              Icons.filter_list,
            ),
          ),
          PopupMenuButton<GroupType>(
            onSelected: (value) {
              Navigator.of(context).pushNamed("/group_list_page",
                  arguments: InventoryGroupArgument(
                      type: value,
                      data: context
                          .read<InventoriesBloc>()
                          .state
                          .inventoryDetails));
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: GroupType.processor,
                  child: const Text("Processor"),
                  onTap: () {},
                ),
                const PopupMenuItem(
                  value: GroupType.ram,
                  child: Text("Ram"),
                ),
                const PopupMenuItem(
                  value: GroupType.storage,
                  child: Text("Storage"),
                ),
                const PopupMenuItem(
                  value: GroupType.operatingSystem,
                  child: Text("Operating System"),
                ),
                const PopupMenuItem(
                  value: GroupType.department,
                  child: Text("Department"),
                ),
              ];
            },
          ),
        ],
      ),
      body: BlocBuilder<InventoriesBloc, InventoriesState>(
        builder: (BuildContext context, state) {
          return Column(
            children: [
              (state.inventoryDetails.isNotEmpty)
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 15),
                      child: CommonTextField(
                        controller: searchController,
                        hintText: "Search Here ..",
                        button: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                        ),
                        onFieldSubmitted: (val) {
                          context.read<InventoriesBloc>().add(SearchedDataEvent(
                              searchedText: searchController.text));
                          searchController.clear();
                        },
                      ),
                    )
                  : Container(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, right: 10, left: 10, bottom: 15),
                  child: ListView.builder(
                    itemCount: state.inventoryDetails.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      final data = state.inventoryDetails[i];
                      return InventoryItem(detail: data);
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add_page");
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class InventoryItem extends StatelessWidget {
  final InventoryDetail detail;

  const InventoryItem({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date =
    DateFormat("yMMMMd").format(detail.purchaseDate);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/add_page",
            arguments: detail);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
            vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff23232E),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Column(children: [
                      const Text(
                        "ID",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff8A8AA0),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "${detail.id}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ]),
                    const SizedBox(height: 15),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Processor",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff8A8AA0),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          detail.processor.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Ram",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff8A8AA0),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "${detail.ram.ramFrom} - ${detail.ram.ramTo}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Department",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff8A8AA0),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          detail.department.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Assign To",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff8A8AA0),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          detail.assignTo,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Operating System",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff8A8AA0),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          detail.operatingSystem.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Storage",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff8A8AA0),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "${detail.storageData.storageFrom} - ${detail.storageData.storageTo}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Purchase Date",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff8A8AA0),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          date,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
