import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_system/model/inventory_model.dart';
import 'package:management_system/services/database.dart';
import 'inventories_event.dart';
import 'inventories_state.dart';

class InventoriesBloc extends Bloc<InventoriesEvent, InventoriesState> {
  final MyDatabase database = MyDatabase.getInstance();
  late StreamSubscription subscription;

  InventoriesBloc(super.initialState) {
    on<InventoryDataUpdated>(_onInventoryDataUpdatedEvent);
    on<FilterUpdatedEvent>(_onFilterUpdatedEvent);
    on<SearchedDataEvent>(_onSearchedDataEvent);
    on<GroupListEvent>(_onGroupListEvent);

    subscription = database.getInventoryDetails().listen(_onInventoryDataUpdated);
  }

  FutureOr<void> _onInventoryDataUpdatedEvent(InventoryDataUpdated event, Emitter<InventoriesState> emit) {
    emit(state.copyWith(inventoryDetails: event.inventoryDetails));
  }

  void _onInventoryDataUpdated(List<InventoryDetail> event) {
    add(InventoryDataUpdated(inventoryDetails: event));
  }

  FutureOr<void> _onFilterUpdatedEvent(FilterUpdatedEvent event, Emitter<InventoriesState> emit) async {
    emit(InventoriesState(filterList: event.filter));
    await subscription.cancel();
    subscription = database.getInventoryDetails(event.filter).listen(_onInventoryDataUpdated);
  }

  FutureOr<void> _onSearchedDataEvent(SearchedDataEvent event, Emitter<InventoriesState> emit) async {
    await subscription.cancel();
    subscription = database.getInventoryDetails(state.filterList, event.searchedText).listen(_onInventoryDataUpdated);
  }

  FutureOr<void> _onGroupListEvent(GroupListEvent event, Emitter<InventoriesState> emit) {

  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
