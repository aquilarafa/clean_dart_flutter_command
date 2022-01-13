import 'package:clean_dart_flutter_command/src/search/domain/entities/result.dart';
import 'package:clean_dart_flutter_command/src/search/domain/usecases/search_by_text.dart';
import 'package:clean_dart_flutter_command/src/search/presenter/commands/search_by_text_command.dart';
import 'package:flutter_command/flutter_command.dart';

class SearchStore {
  SearchStore({
    required SearchByText searchByText,
  }) {
    // Commands
    searchByTextCommand = SearchByTextCommand(
      searchByText: searchByText,
    ).create();

    textChangedCommand = Command.createSync((text) => text, '');

    // Execute search after debounce
    textChangedCommand.debounce(const Duration(milliseconds: 500)).listen(
      (filterText, _) {
        searchByTextCommand.execute(filterText);
      },
    );
  }

  late Command<String, List<Result>> searchByTextCommand;
  late Command<String, String> textChangedCommand;

  // Aliases for commands above since commands are ValueNotifiers

  // ValueListenable<List<Result>> get resultsNotifier => searchByTextCommand;

  // ValueListenable<bool> get loadingNotifier => searchByTextCommand.isExecuting;

  // ValueListenable<String?> get errorNotifier {
  //   return searchByTextCommand.thrownExceptions.map((commandError) {
  //     return commandError?.error?.toString();
  //   });
  // }
}
