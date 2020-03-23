import 'package:flutter/material.dart';

class PaperInput extends StatelessWidget {
  final String errorText;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final int maxLines;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  PaperInput({
    this.errorText,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.maxLines,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: this.obscureText,
      maxLines: this.maxLines,
      controller: this.controller,
      onChanged: this.onChanged,
      decoration: InputDecoration(
        errorText: this.errorText,
        labelText: this.labelText,
        hintText: this.hintText,
      ),
    );
  }
}
