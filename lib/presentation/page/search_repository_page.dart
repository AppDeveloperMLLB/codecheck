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
        title: const Text('Search Repository'),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: searchTextController,
                decoration: const InputDecoration(
                  labelText: 'Search Text',
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please input search text';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    searchWord.value = searchTextController.text;
                  }
                },
                child: const Text('Search'),
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
