import 'package:flutter/material.dart';

class RepositoryDetailsItem extends StatelessWidget {
  const RepositoryDetailsItem({
    super.key,
    required this.label,
    required this.content,
  });
  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text(
            content,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
