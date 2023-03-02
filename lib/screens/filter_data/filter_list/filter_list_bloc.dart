import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'filter_list_event.dart';
import 'filter_list_state.dart';

class FilterListBloc extends Bloc<FilterListEvents, FilterListState> {
  FilterListBloc(super.initialState) {
    on<CheckBoxClickEvent>(_onCheckBoxClickEvent);
  }

  FutureOr<void> _onCheckBoxClickEvent(CheckBoxClickEvent event, Emitter<FilterListState> emit) {
    final items = List<FilterItem>.from(state.items);
    items[event.index] = items[event.index].copyWith(isSelected: event.selected);
    emit(state.copyWith(items: items));
  }
}
