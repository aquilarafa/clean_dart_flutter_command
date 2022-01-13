import 'package:clean_dart_flutter_command/src/search/infra/datasources/isearch_datasource.dart';
import 'package:clean_dart_flutter_command/src/search/infra/models/result_model.dart';
import 'package:dartz/dartz.dart';
import 'package:uno/uno.dart';

class GithubSearchDatasource implements ISearchDatasource {
  final uno = Uno();

  @override
  Future<Either<Exception, List<ResultModel>>> searchText(String text) async {
    try {
      final result = await uno.get(
          "https://api.github.com/search/users?q=${text.trim().replaceAll(' ', '+')}");
      if (result.status == 200) {
        final jsonList = result.data['items'] as List;
        final list = jsonList
            .map((map) => ResultModel.fromMap(map as Map<String, dynamic>))
            .toList();
        return right(list);
      } else {
        return left(Exception());
      }
    } catch (e) {
      return left(Exception());
    }
  }
}
