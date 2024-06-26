import 'package:flutter/material.dart';

class SearchInputWidget extends StatelessWidget {
  final void Function(String value) onSearch;
  final TextEditingController inputController;

  const SearchInputWidget({
    required this.onSearch,
    required this.inputController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18, left: 16, right: 16, top: 0),
      child: TextField(
        controller: inputController,
        onSubmitted: onSearch,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search_outlined,
            size: 24,
          ),
          hintText: 'Busque por usuário...',
          hintStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
