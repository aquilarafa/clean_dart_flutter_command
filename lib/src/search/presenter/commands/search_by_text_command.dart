import 'package:clean_dart_flutter_command/src/search/domain/entities/result.dart';
import 'package:clean_dart_flutter_command/src/search/domain/usecases/search_by_text.dart';
import 'package:flutter_command/flutter_command.dart';

class SearchByTextCommand {
  SearchByTextCommand({
    required this.searchByText,
  });
  final SearchByText searchByText;

  Command<String, List<Result>> create() {
    return Command.createAsync<String, List<Result>>(
      _execute,
      [],
    );
  }

  Future<List<Result>> _execute(String text) async {
    final result = await searchByText(text);
    return result.fold(
      (exception) => throw 'Falha ao carregar lista.',
      (results) => results,
    );
  }
}
