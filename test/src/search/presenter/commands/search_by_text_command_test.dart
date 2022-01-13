import 'package:clean_dart_flutter_command/src/search/domain/entities/result.dart';
import 'package:clean_dart_flutter_command/src/search/domain/usecases/search_by_text.dart';
import 'package:clean_dart_flutter_command/src/search/presenter/commands/search_by_text_command.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SearchByTextMock extends Mock implements SearchByText {}

void main() {
  late Command<String, List<Result>> searchByTextCommand;
  late SearchByText searchByTextMock;

  setUp(() {
    searchByTextMock = SearchByTextMock();
    searchByTextCommand = SearchByTextCommand(
      searchByText: searchByTextMock,
    ).create();
  });
  group('SearchByTextCommand', () {
    test('should init empty', () {
      expect(searchByTextCommand.value, []);
      expect(searchByTextCommand.isExecuting.value, false);
      expect(searchByTextCommand.thrownExceptions.value, isNull);
    });

    test('should return a list of results', () async {
      final results = List.generate(
        20,
        (index) => Result(
          image: '',
          name: 'name$index',
          url: '',
        ),
      );
      when(() => searchByTextMock(any()))
          .thenAnswer((_) async => right(results));
      await searchByTextCommand.executeWithFuture('textFilter');

      expect(searchByTextCommand.value, results);
    });

    test('should throw an exception', () async {
      when(() => searchByTextMock(any()))
          .thenAnswer((_) async => left(Exception('Fail')));
      searchByTextCommand.execute('textFilter');
      await Future.delayed(const Duration(milliseconds: 10));

      expect(searchByTextCommand.value, []);
      expect(searchByTextCommand.thrownExceptions.value,
          isA<CommandError<String>>());
    });
  });
}
