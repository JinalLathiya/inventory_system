import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:management_system/widgets/comman_drop_down.dart';

import '../../model/inventory_model.dart';
import '../../services/database.dart';
import '../../widgets/comman_text_field.dart';
import 'add_inventory_bloc/add_inventory_bloc.dart';
import 'add_inventory_bloc/add_inventory_event.dart';
import 'add_inventory_bloc/add_inventory_state.dart';

class AddPage extends StatefulWidget {
  final InventoryDetail? inventoryData;

  const AddPage({
    Key? key,
    this.inventoryData,
  }) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  MyDatabase database = MyDatabase.getInstance();
  final formatedDate = DateFormat("yMMMMd");
  late TextEditingController assignController =
      TextEditingController(text: widget.inventoryData?.assignTo);
  late TextEditingController dateController = TextEditingController(
      text: widget.inventoryData == null
          ? null
          : formatedDate.format(widget.inventoryData!.purchaseDate));
  late DateTime? _dateTime = widget.inventoryData?.purchaseDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: (widget.inventoryData != null)
            ? const Text("Edit Information")
            : const Text("Add Information"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: (widget.inventoryData != null)
            ? [
                IconButton(
                  onPressed: () {
                    context
                        .read<AddInventoryBloc>()
                        .add(DeleteDataEvent(widget.inventoryData!.id));
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.delete),
                )
              ]
            : [],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            BlocBuilder<AddInventoryBloc, AddInventoryState>(
              buildWhen: (previous, current) =>
                  previous.processors != current.processors ||
                  previous.selectedProcessor != current.selectedProcessor,
              builder: (context, state) {
                return CommonDropdown<int>(
                  dropDownValue: state.selectedProcessor,
                  hintText: "Select Processors",
                  items: state.processors
                      .map((e) => DropdownMenuItem(
                          value: e.id, child: Text(e.name)))
                      .toList(),
                  onChanged: (val) {
                    // log("========================= $val");
                    if (val == null) return;
                    context.read<AddInventoryBloc>().add(
                        SelectedProcessorChangeEvent(selectedProcessorId: val));
                  },
                  onValidate: (val) {
                    if (val == null) {
                      return "Please Select Processors";
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<AddInventoryBloc, AddInventoryState>(
              buildWhen: (previous, current) =>
                  previous.rams != current.rams ||
                  previous.selectedRam != current.selectedRam,
              builder: (context, state) {
                return CommonDropdown<int>(
                  dropDownValue: state.selectedRam,
                  hintText: "Select Ram",
                  items: state.rams
                      .map((e) => DropdownMenuItem(
                            value: e.id,
                            child: Text("${e.ramFrom} - ${e.ramTo}" ?? ""),
                          ))
                      .toList(),
                  onChanged: (val) {
                    if (val == null) return;
                    context
                        .read<AddInventoryBloc>()
                        .add(SelectedRamChangeEvent(selectedRamId: val));
                  },
                  onValidate: (val) {
                    if (val == null) {
                      return "Please Select Ram";
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<AddInventoryBloc, AddInventoryState>(
              buildWhen: (previous, current) =>
                  previous.storage != current.storage ||
                  previous.selectedStorage != current.selectedStorage,
              builder: (context, state) {
                return CommonDropdown<int>(
                  dropDownValue: state.selectedStorage,
                  hintText: "Select Storage",
                  items: state.storage
                      .map((e) => DropdownMenuItem(
                            value: e.id,
                            child:
                                Text("${e.storageFrom} - ${e.storageTo}" ?? ""),
                          ))
                      .toList(),
                  onChanged: (val) {
                    if (val == null) return;
                    context.read<AddInventoryBloc>().add(
                        SelectedStorageChangeEvent(selectedStorageId: val));
                  },
                  onValidate: (val) {
                    if (val == null) {
                      return "Please Select Storage";
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<AddInventoryBloc, AddInventoryState>(
              buildWhen: (previous, current) =>
                  previous.operatingSystem != current.operatingSystem ||
                  previous.selectedOs != current.selectedOs,
              builder: (context, state) {
                return CommonDropdown<int>(
                  dropDownValue: state.selectedOs,
                  hintText: "Select Operating Systems",
                  items: state.operatingSystem
                      .map((e) =>
                          DropdownMenuItem(value: e.id, child: Text(e.name)))
                      .toList(),
                  onChanged: (val) {
                    if (val == null) return;
                    context
                        .read<AddInventoryBloc>()
                        .add(SelectedOsChangeEvent(selectedOsId: val));
                  },
                  onValidate: (val) {
                    if (val == null) {
                      return "Please Select Operating Systems";
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<AddInventoryBloc, AddInventoryState>(
              buildWhen: (previous, current) =>
                  previous.departments != current.departments ||
                  previous.selectedDepartments != current.selectedDepartments,
              builder: (context, state) {
                return CommonDropdown<int>(
                  dropDownValue: state.selectedDepartments,
                  hintText: "Select Departments",
                  items: state.departments
                      .map((e) => DropdownMenuItem(
                          value: e.id, child: Text(e.name ?? "")))
                      .toList(),
                  onChanged: (val) {
                    if (val == null) return;
                    context.read<AddInventoryBloc>().add(
                        SelectedDepartmentChangeEvent(
                            selectedDepartmentId: val));
                  },
                  onValidate: (val) {
                    if (val == null) {
                      return "Please Select Departments";
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            CommonTextField(
              controller: assignController,
              hintText: "Assign this Computer To",
              onFieldSubmitted: (val) {
                assignController.text == val;
              },
              onValidate: (val) {
                if (val == null) {
                  return "Please fill the fields";
                }
              },
            ),
            const SizedBox(height: 20),
            CommonTextField(
                controller: dateController,
                hintText: "Add Purchase Date",
                readOnly: true,
                onFieldSubmitted: (val) {},
                button: IconButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2024),
                    );
                    if (pickedDate != null) {
                      _dateTime = pickedDate;
                      dateController.text = formatedDate.format(pickedDate);
                    }
                  },
                  icon: const Icon(
                    Icons.calendar_month_rounded,
                  ),
                ),
                onValidate: (val) {
                  if (val == null) {
                    return "Please Select Date";
                  }
                }),
            const SizedBox(height: 40),
            BlocBuilder<AddInventoryBloc, AddInventoryState>(
              builder: (context, state) {
                return FloatingActionButton.extended(
                  extendedPadding: const EdgeInsets.symmetric(horizontal: 120),
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      if (widget.inventoryData == null) {
                        context.read<AddInventoryBloc>().add(
                              InsertDataEvent(
                                assignToName: assignController.text,
                                purchaseDate: _dateTime ?? DateTime.now(),
                              ),
                            );
                      } else {
                        context.read<AddInventoryBloc>().add(UpdateDataEvent(
                            id: widget.inventoryData!.id,
                            assignToName: assignController.text,
                            purchaseDate: _dateTime ?? DateTime.now()));
                      }
                      Navigator.of(context).pop();
                    }
                  },
                  label: (widget.inventoryData != null)
                      ? const Text(
                          "EDIT",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : const Text(
                          "SAVE",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
