import "package:codecheck/presentation/widget/avatar_image.dart";
import "package:flutter/material.dart";

class RepositoryDetailsTitle extends StatelessWidget {
  const RepositoryDetailsTitle({
    required this.fullName,
    super.key,
    this.avatarUrl,
  });
  final String fullName;
  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 72,
          width: 72,
          child: AvatarImage(
            url: avatarUrl,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Flexible(
          child: Text(
            fullName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}
