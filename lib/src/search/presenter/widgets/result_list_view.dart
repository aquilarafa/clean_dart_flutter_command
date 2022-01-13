import 'package:clean_dart_flutter_command/src/search/domain/entities/result.dart';
import 'package:flutter/material.dart';

class ResultListView extends StatelessWidget {
  const ResultListView({
    required this.list,
    Key? key,
  }) : super(key: key);
  final List<Result> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(item.image),
          ),
          title: Text(
            item.name,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }
}
