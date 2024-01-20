import "package:flutter/material.dart";

class InputTextFormField extends StatelessWidget {
  const InputTextFormField({
    required this.controller,
    required this.label,
    super.key,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.titleMedium,
      decoration: InputDecoration(
        labelText: label,
      ),
      validator: validator,
    );
  }
}
