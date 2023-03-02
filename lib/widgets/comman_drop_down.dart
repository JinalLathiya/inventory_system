import 'package:flutter/material.dart';

class CommonDropdown<T> extends StatefulWidget {
  final T? dropDownValue;
  final String hintText;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final FormFieldValidator<T>? onValidate;

  const CommonDropdown({
    Key? key,
    this.dropDownValue,
    required this.hintText,
    required this.items,
    required this.onChanged,
    required this.onValidate,
  }) : super(key: key);

  @override
  State<CommonDropdown<T>> createState() => _CommonDropdownState<T>();
}

class _CommonDropdownState<T> extends State<CommonDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: widget.dropDownValue,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.yellow,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      hint: Text(widget.hintText),
      items: widget.items,
      onChanged: widget.onChanged,
      validator: widget.onValidate,
    );
  }
}
