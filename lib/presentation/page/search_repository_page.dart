import 'package:codecheck/presentation/app_strings.dart';
import 'package:codecheck/presentation/validator/search_text_validator.dart';
import 'package:codecheck/presentation/widget/github_repository_list_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SearchRepositoryPage extends HookConsumerWidget {
  SearchRepositoryPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTextController = useTextEditingController();
    final searchWord = useState('');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.searchRepositoryPageTitle,
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: searchTextController,
                decoration: const InputDecoration(
                  labelText: AppStrings.searchTextLabel,
                ),
                validator: (text) {
                  return SearchTextValidator.validate(text);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    searchWord.value = searchTextController.text;
                  }
                },
                child: const Text(
                  AppStrings.searchButtonLabel,
                ),
              ),
              if (searchWord.value.isNotEmpty)
                Expanded(
                  child: GithubRepositoryListView(
                    searchWord: searchTextController.text,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
