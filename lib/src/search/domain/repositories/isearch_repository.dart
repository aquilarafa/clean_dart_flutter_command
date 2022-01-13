import 'package:clean_dart_flutter_command/src/search/domain/entities/result.dart';
import 'package:dartz/dartz.dart';

abstract class ISearchRepository {
  Future<Either<Exception, List<Result>>> searchText(String text);
}
