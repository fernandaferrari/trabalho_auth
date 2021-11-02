import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String descText;
  final int? line;
  final int? tamanho;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final String? initialValue;
  final bool? obscureText;

  const CustomTextField(
      {Key? key,
      required this.label,
      required this.descText,
      this.line,
      this.tamanho,
      this.validator,
      this.initialValue,
      this.onSaved,
      this.keyboardType,
      this.controller,
      this.focusNode,
      this.textInputAction,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller == null ? null : controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: '${label}',
        hintText: '${descText}',
      ),
      maxLength: tamanho == null ? null : tamanho,
      maxLines: line == null ? null : line,
      keyboardType: keyboardType == null ? null : keyboardType,
      focusNode: focusNode == null ? null : focusNode,
      textInputAction: textInputAction == null ? null : textInputAction,
      obscureText: obscureText == null ? false : true,
    );
  }
}
