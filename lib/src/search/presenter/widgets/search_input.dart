import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    required this.onChanged,
    Key? key,
  }) : super(key: key);
  final void Function(String text) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
      child: TextField(
        autocorrect: false,
        decoration: const InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Color.fromARGB(150, 0, 0, 0)),
        ),
        style: const TextStyle(
          fontSize: 20.0,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
