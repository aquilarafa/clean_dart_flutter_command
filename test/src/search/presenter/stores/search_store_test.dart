import 'package:clean_dart_flutter_command/src/search/domain/usecases/search_by_text.dart';
import 'package:clean_dart_flutter_command/src/search/presenter/stores/search_store.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SearchByTextMock extends Mock implements SearchByText {}

void main() {
  late SearchByText searchByTextMock;
  late SearchStore searchStore;
  setUp(() {
    searchByTextMock = SearchByTextMock();
    searchStore = SearchStore(
      searchByText: searchByTextMock,
    );
  });
  group('SearchStore', () {
    test('should init empty', () {
      expect(searchStore.searchByTextCommand.value, []);
      expect(searchStore.searchByTextCommand.isExecuting.value, false);
      expect(searchStore.searchByTextCommand.thrownExceptions.value, isNull);
    });

    test('should trigger the search', () async {
      when(() => searchByTextMock(any()))
          .thenAnswer((_) async => left(Exception('Fail')));
      searchStore.textChangedCommand('textFilter');
      await Future.delayed(const Duration(milliseconds: 50));
      expect(searchStore.textChangedCommand.value, 'textFilter');
      expect(searchStore.searchByTextCommand.thrownExceptions.value, isNotNull);
    });
  });
}
