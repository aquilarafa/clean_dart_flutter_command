import 'package:clean_dart_flutter_command/src/search/domain/entities/result.dart';

class ResultModel extends Result {
  const ResultModel({
    required String image,
    required String name,
    String? url,
  }) : super(
          image: image,
          name: name,
          url: url,
        );

  static ResultModel fromMap(Map<String, dynamic> map) {
    return ResultModel(
      image: map['avatar_url'],
      name: map['login'],
      url: map['url'],
    );
  }
}
