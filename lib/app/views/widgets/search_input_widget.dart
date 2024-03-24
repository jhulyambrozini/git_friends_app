import 'package:flutter/material.dart';

class SearchInputWidget extends StatelessWidget {
  final void Function(String value) onSearch;

  const SearchInputWidget({
    required this.onSearch,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18, left: 16, right: 16, top: 0),
      child: TextField(
        onChanged: onSearch,
        decoration: const InputDecoration(
          suffixIcon: Icon(Icons.search_outlined),
          hintText: 'Busque por usuário...',
          hintStyle: TextStyle(fontWeight: FontWeight.normal),
          border: UnderlineInputBorder(
            borderSide: BorderSide(strokeAlign: 23),
          ),
        ),
      ),
    );
  }
}
