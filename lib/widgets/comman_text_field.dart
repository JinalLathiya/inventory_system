import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  ValueChanged<String>? onFieldSubmitted;
  ValueChanged<String>? onChanged;
  VoidCallback? onEditingCompleted;
  GestureTapCallback? onTap;
  IconButton? button;
  dynamic onSaved;
  dynamic onValidate;
  GlobalKey? globalKey;
  bool readOnly;

  CommonTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.onFieldSubmitted,
      this.button,
      this.onTap,
      this.onSaved,
      this.onValidate,
      this.onChanged,
      this.onEditingCompleted,
      this.readOnly = false,
      this.globalKey})
      : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.always,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        hintText: widget.hintText,
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
        suffixIcon: widget.button,
      ),
      onFieldSubmitted: widget.onFieldSubmitted,
      onTap: widget.onTap,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingCompleted,
      validator: widget.onValidate,
    );
  }
}
