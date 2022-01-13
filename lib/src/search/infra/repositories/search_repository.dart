import 'package:clean_dart_flutter_command/src/search/domain/entities/result.dart';
import 'package:clean_dart_flutter_command/src/search/domain/repositories/isearch_repository.dart';
import 'package:clean_dart_flutter_command/src/search/infra/datasources/isearch_datasource.dart';
import 'package:dartz/dartz.dart';

class SearchRepository implements ISearchRepository {
  SearchRepository({
    required ISearchDatasource searchDatasource,
  }) : _searchDatasource = searchDatasource;
  final ISearchDatasource _searchDatasource;

  @override
  Future<Either<Exception, List<Result>>> searchText(String text) {
    return _searchDatasource.searchText(text);
  }
}
