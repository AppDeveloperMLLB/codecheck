import 'package:codecheck/presentation/app_strings.dart';
import 'package:codecheck/presentation/validator/search_text_validator.dart';
import 'package:codecheck/presentation/widget/form_button.dart';
import 'package:codecheck/presentation/widget/github_repository_list_view.dart';
import 'package:codecheck/presentation/widget/input_text_form_field.dart';
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
              Padding(
                padding: const EdgeInsets.all(16),
                child: InputTextFormField(
                  controller: searchTextController,
                  label: AppStrings.searchTextLabel,
                  validator: (text) {
                    return SearchTextValidator.validate(text);
                  },
                ),
              ),
              FormButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    searchWord.value = searchTextController.text;
                  }
                },
                text: AppStrings.searchButtonLabel,
              ),
              if (searchWord.value.isNotEmpty)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GithubRepositoryListView(
                      searchWord: searchTextController.text,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
