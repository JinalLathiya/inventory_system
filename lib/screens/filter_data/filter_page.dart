import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:management_system/services/database.dart';

import '../../widgets/comman_text_field.dart';
import 'filter_list/filter_list_bloc.dart';
import 'filter_list/filter_list_event.dart';
import 'filter_list/filter_list_state.dart';
import 'inventory_filter_bloc/inventory_filter_bloc.dart';
import 'inventory_filter_bloc/inventory_filter_event.dart';
import 'inventory_filter_bloc/inventory_filter_state.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  final GlobalKey<FormState> _dateKey = GlobalKey<FormState>();
  DateTime? startDate, endDate;
  late final FilterList filterList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          BlocBuilder<InventoryFilterBloc, InventoryFilterState>(
            builder: (context, state) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  context.read<InventoryFilterBloc>().add(ClearFilterEvent());
                  startDateController.clear();
                  endDateController.clear();
                },
                child: const Text(
                  "Clear Filters",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          ),
        ],
        title: const Text("Filters"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 12,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: BlocBuilder<InventoryFilterBloc, InventoryFilterState>(
                    builder: (context, state) {
                      return ListView(
                        children: const [
                          FilterTypeLabel(type: FilterType.processor, label: "Processor"),
                          FilterTypeLabel(type: FilterType.ram, label: "Ram"),
                          FilterTypeLabel(type: FilterType.storage, label: "Storage"),
                          FilterTypeLabel(type: FilterType.os, label: "Operating System"),
                          FilterTypeLabel(type: FilterType.department, label: "Department"),
                          FilterTypeLabel(type: FilterType.date, label: "Date"),
                        ],
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: BlocSelector<InventoryFilterBloc, InventoryFilterState, FilterType>(
                      selector: (state) => state.selectedFilter,
                      builder: (context, selectedFilter) {
                        switch (selectedFilter) {
                          case FilterType.processor:
                            return BlocSelector<InventoryFilterBloc, InventoryFilterState, List<Processor>>(
                              selector: (state) => state.filterProcessor,
                              builder: (context, state) {
                                if (state.isEmpty) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return BlocBuilder<InventoryFilterBloc, InventoryFilterState>(
                                  buildWhen: (previous, current) =>
                                      previous.selectedFilterProcessor != current.selectedFilterProcessor,
                                  builder: (context, stateInventory) {
                                    return BlocProvider(
                                      key: const Key("processors"),
                                      create: (context) => FilterListBloc(FilterListState(
                                        items: state
                                            .map((e) => FilterItem(
                                                  id: e.id,
                                                  label: e.name,
                                                  isSelected:
                                                      stateInventory.selectedFilterProcessor?.contains(e.id) ?? false,
                                                ))
                                            .toList(),
                                      )),
                                      child: FilterListView(
                                        callBack: (id) {
                                          context.read<InventoryFilterBloc>().add(
                                                FilterDataEvent(
                                                  id: id,
                                                  filterType: selectedFilter,
                                                ),
                                              );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          case FilterType.ram:
                            return BlocSelector<InventoryFilterBloc, InventoryFilterState, List<RamData>>(
                              selector: (state) => state.filterRams,
                              builder: (context, state) {
                                if (state.isEmpty) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return BlocBuilder<InventoryFilterBloc, InventoryFilterState>(
                                  buildWhen: (previous, current) =>
                                      previous.selectedFilterRam != current.selectedFilterRam,
                                  builder: (context, stateInventory) {
                                    return BlocProvider(
                                      key: const Key("Rams"),
                                      create: (context) => FilterListBloc(FilterListState(
                                        items: state
                                            .map((e) => FilterItem(
                                                  id: e.id,
                                                  label: "${e.ramFrom.toString()} - ${e.ramTo.toString()}",
                                                  isSelected: stateInventory.selectedFilterRam?.contains(e.id) ?? false,
                                                ))
                                            .toList(),
                                      )),
                                      child: FilterListView(
                                        callBack: (id) {
                                          context.read<InventoryFilterBloc>().add(
                                                FilterDataEvent(
                                                  id: id,
                                                  filterType: selectedFilter,
                                                ),
                                              );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            );

                          case FilterType.storage:
                            return BlocSelector<InventoryFilterBloc, InventoryFilterState, List<StorageData>>(
                              selector: (state) => state.filterStorage,
                              builder: (context, state) {
                                if (state.isEmpty) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return BlocBuilder<InventoryFilterBloc, InventoryFilterState>(
                                  buildWhen: (previous, current) =>
                                      previous.selectedFilterStorage != current.selectedFilterStorage,
                                  builder: (context, stateInventory) {
                                    return BlocProvider(
                                      key: const Key("Storages"),
                                      create: (context) => FilterListBloc(FilterListState(
                                        items: state
                                            .map((e) => FilterItem(
                                                  id: e.id,
                                                  label: "${e.storageFrom.toString()} - ${e.storageTo.toString()}",
                                                  isSelected:
                                                      stateInventory.selectedFilterStorage?.contains(e.id) ?? false,
                                                ))
                                            .toList(),
                                      )),
                                      child: FilterListView(
                                        callBack: (id) {
                                          context.read<InventoryFilterBloc>().add(
                                                FilterDataEvent(
                                                  id: id,
                                                  filterType: selectedFilter,
                                                ),
                                              );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            );

                          case FilterType.os:
                            return BlocSelector<InventoryFilterBloc, InventoryFilterState, List<OperatingSystem>>(
                              selector: (state) => state.filterOs,
                              builder: (context, state) {
                                if (state.isEmpty) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return BlocBuilder<InventoryFilterBloc, InventoryFilterState>(
                                    buildWhen: (previous, current) =>
                                        previous.selectedFilterOs != current.selectedFilterOs,
                                    builder: (context, stateInventory) {
                                      return BlocProvider(
                                        key: const Key("Operating Systems"),
                                        create: (context) => FilterListBloc(FilterListState(
                                          items: state
                                              .map((e) => FilterItem(
                                                    id: e.id,
                                                    label: e.name,
                                                    isSelected:
                                                        stateInventory.selectedFilterOs?.contains(e.id) ?? false,
                                                  ))
                                              .toList(),
                                        )),
                                        child: FilterListView(
                                          callBack: (id) {
                                            context.read<InventoryFilterBloc>().add(
                                                  FilterDataEvent(
                                                    id: id,
                                                    filterType: selectedFilter,
                                                  ),
                                                );
                                          },
                                        ),
                                      );
                                    });
                              },
                            );
                          case FilterType.department:
                            return BlocSelector<InventoryFilterBloc, InventoryFilterState, List<Department>>(
                              selector: (state) => state.filterDepartments,
                              builder: (context, state) {
                                if (state.isEmpty) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return BlocBuilder<InventoryFilterBloc, InventoryFilterState>(
                                    buildWhen: (previous, current) =>
                                        previous.selectedFilterDepartments != current.selectedFilterDepartments,
                                    builder: (context, stateInventory) {
                                      return BlocProvider(
                                        key: const Key("Departments"),
                                        create: (context) => FilterListBloc(
                                          FilterListState(
                                            items: state
                                                .map((e) => FilterItem(
                                                      id: e.id,
                                                      label: e.name,
                                                      isSelected:
                                                          stateInventory.selectedFilterDepartments?.contains(e.id) ??
                                                              false,
                                                    ))
                                                .toList(),
                                          ),
                                        ),
                                        child: FilterListView(
                                          callBack: (id) {
                                            context.read<InventoryFilterBloc>().add(
                                                  FilterDataEvent(
                                                    id: id,
                                                    filterType: selectedFilter,
                                                  ),
                                                );
                                          },
                                        ),
                                      );
                                    });
                              },
                            );
                          case FilterType.date:
                            return BlocBuilder<InventoryFilterBloc, InventoryFilterState>(
                              buildWhen: (previous, current) => previous.dateTimeRange != current.dateTimeRange,
                              builder: (context, dateState) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                  child: Form(
                                    key: _dateKey,
                                    child: Column(
                                      children: [
                                        CommonTextField(
                                          controller: startDateController,
                                          hintText: "Add Start Date",
                                          readOnly: true,
                                          onValidate: (value) {
                                            if (startDate == null) return "Please Select Start Date";
                                            return null;
                                          },
                                          button: IconButton(
                                            onPressed: () async {
                                              DateTime? pickedDate = await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2022),
                                                lastDate: DateTime(2024),
                                              );
                                              if (pickedDate != null) {
                                                startDate = pickedDate;
                                                startDateController.text = DateFormat("yyyy-MM-dd").format(startDate!);
                                              }
                                            },
                                            icon: const Icon(
                                              Icons.calendar_month_rounded,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        CommonTextField(
                                          controller: endDateController,
                                          hintText: "Add End Date",
                                          readOnly: true,
                                          onValidate: (val) {
                                            if (endDate == null) return "Please Select End Date";
                                            if (endDate!.isBefore(startDate!)) {
                                              return "End Date Must Be After Start Date";
                                            }
                                            return null;
                                          },
                                          button: IconButton(
                                            onPressed: () async {
                                              DateTime? pickedDate = await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2022),
                                                lastDate: DateTime(2024),
                                              );
                                              if (pickedDate != null) {
                                                endDate = pickedDate;
                                                endDateController.text = DateFormat("yyyy-MM-dd").format(endDate!);
                                              }
                                            },
                                            icon: const Icon(
                                              Icons.calendar_month_rounded,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 30),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.yellow,
                                            foregroundColor: Colors.black,
                                            padding: const EdgeInsets.symmetric(horizontal: 20),
                                          ),
                                          onPressed: () {
                                            if (_dateKey.currentState!.validate()) {
                                              context.read<InventoryFilterBloc>().add(
                                                    FilterDateEvent(
                                                      startDate: DateTime.parse(startDateController.text),
                                                      endDate: DateTime.parse(endDateController.text),
                                                    ),
                                                  );
                                            }
                                          },
                                          child: const Text(
                                            "SET",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<InventoryFilterBloc, InventoryFilterState>(builder: (context, state) {
            return Container(
              height: 50,
              width: double.infinity,
              color: Colors.black.withOpacity(0.5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  filterList = FilterList(
                    selectedProcessorsIds: state.selectedFilterProcessor!,
                    selectedRamsIds: state.selectedFilterRam!,
                    selectedStorageIds: state.selectedFilterStorage!,
                    selectedOsIds: state.selectedFilterOs!,
                    selectedDepartmentsIds: state.selectedFilterDepartments!,
                    selectedDateTimeRange: state.dateTimeRange,
                  );
                  Navigator.of(context).pop(filterList);
                },
                child: const Text(
                  "APPLY FILTERS",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class FilterListView extends StatelessWidget {
  final Function(int id) callBack;

  const FilterListView({Key? key, required this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterListBloc, FilterListState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.items.length,
          itemBuilder: (context, index) {
            final item = state.items[index];
            return CheckboxListTile(
              title: Text(item.label),
              value: item.isSelected,
              tristate: false,
              checkColor: Colors.black,
              activeColor: Colors.yellow,
              onChanged: (value) {
                if (value != null) {
                  context.read<FilterListBloc>().add(
                        CheckBoxClickEvent(index: index, selected: value),
                      );
                  callBack.call(state.items[index].id);
                  // print("========================= Index : $index");
                  // print("========================= Item Index : ${state.items[index].id}");
                  // print("========================= Changed Value : $value");
                }
              },
            );
          },
        );
      },
    );
  }
}

class FilterTypeLabel extends StatelessWidget {
  final FilterType type;
  final String label;

  const FilterTypeLabel({Key? key, required this.type, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.select<InventoryFilterBloc, bool>((value) => value.state.selectedFilter == type);
    return ListTile(
      selected: selected,
      selectedColor: Colors.yellow,
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: () => context.read<InventoryFilterBloc>().add(SelectedFilterChanged(type: type)),
    );
  }
}
