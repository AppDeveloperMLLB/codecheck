import "package:codecheck/presentation/app_strings.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

class AvatarImage extends HookConsumerWidget {
  const AvatarImage({
    super.key,
    this.url,
  });
  final String? url;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    if (isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    }

    return url == null
        ? _createContainer(
            child: const Center(
              child: Text(
                AppStrings.noImage,
              ),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: Image.network(
              url!,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }

                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return _createContainer(
                  child: IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      isLoading.value = true;
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          isLoading.value = false;
                        },
                      );
                    },
                  ),
                );
              },
            ),
          );
  }

  Widget _createContainer({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(90),
      ),
      child: child,
    );
  }
}
