import 'package:flutter/material.dart';

class RepositoryDetailsViewText extends StatelessWidget {
  const RepositoryDetailsViewText(
    this.text, {
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}