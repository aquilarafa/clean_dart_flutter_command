import 'package:clean_dart_flutter_command/src/search/domain/entities/result.dart';
import 'package:clean_dart_flutter_command/src/search/domain/usecases/search_by_text.dart';
import 'package:clean_dart_flutter_command/src/search/external/datasources/github_search_datasource.dart';
import 'package:clean_dart_flutter_command/src/search/infra/repositories/search_repository.dart';
import 'package:clean_dart_flutter_command/src/search/presenter/stores/search_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';

import 'widgets/result_list_view.dart';
import 'widgets/search_input.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search';
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _store = SearchStore(
    searchByText: SearchByTextImpl(
      searchRepository: SearchRepository(
        searchDatasource: GithubSearchDatasource(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Search'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SearchInput(onChanged: _store.textChangedCommand),
            const SizedBox(height: 16),
            Expanded(
              child: CommandBuilder<String, List<Result>>(
                command: _store.searchByTextCommand,
                onError: (context, error, __, ___) {
                  return Text(error.toString());
                },
                whileExecuting: (context, _, __) {
                  return const Center(child: CircularProgressIndicator());
                },
                onData: (context, list, _) {
                  return ResultListView(list: list);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
