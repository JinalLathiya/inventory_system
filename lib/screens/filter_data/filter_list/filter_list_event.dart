import 'package:equatable/equatable.dart';

abstract class FilterListEvents extends Equatable {
  const FilterListEvents();

  @override
  List<Object?> get props => [];
}

class CheckBoxClickEvent extends FilterListEvents{
  final int index;

  final bool selected;

  const CheckBoxClickEvent({
    required this.index,
    required this.selected,
  });


  @override
  List<Object?> get props => [index,selected];
}