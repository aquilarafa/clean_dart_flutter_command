import 'package:clean_dart_flutter_command/src/search/domain/entities/result.dart';
import 'package:clean_dart_flutter_command/src/search/domain/repositories/isearch_repository.dart';
import 'package:dartz/dartz.dart';

mixin SearchByText {
  Future<Either<Exception, List<Result>>> call(String textSearch);
}

class SearchByTextImpl implements SearchByText {
  SearchByTextImpl({
    required ISearchRepository searchRepository,
  }) : _searchRepository = searchRepository;
  final ISearchRepository _searchRepository;

  @override
  Future<Either<Exception, List<Result>>> call(String textSearch) async {
    return _searchRepository.searchText(textSearch);
  }
}
