import "package:flutter/material.dart";

class FormButton extends StatelessWidget {
  const FormButton({
    required this.text,
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        textStyle: Theme.of(context).textTheme.titleLarge,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          left: 16.0,
          right: 16.0,
          bottom: 8,
        ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
