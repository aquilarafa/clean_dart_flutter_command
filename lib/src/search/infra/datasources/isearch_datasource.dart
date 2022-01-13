import 'package:clean_dart_flutter_command/src/search/infra/models/result_model.dart';
import 'package:dartz/dartz.dart';

abstract class ISearchDatasource {
  Future<Either<Exception, List<ResultModel>>> searchText(String text);
}
