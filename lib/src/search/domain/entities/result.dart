import 'package:equatable/equatable.dart';

class Result extends Equatable {
  final String image;
  final String name;
  final String? url;

  const Result({
    required this.image,
    required this.name,
    this.url,
  });

  @override
  List<Object?> get props => [image, name, url];
}
