import 'package:flutter/material.dart';

class EmptyUserListWidget extends StatelessWidget {
  const EmptyUserListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        const Center(
          child: Text(
            'Busque por um usuário \n e adicione aos favoritos!',
            style: TextStyle(
              color: Color.fromARGB(221, 28, 28, 28),
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        Center(child: Image.asset('assets/search_people.png', width: 300)),
      ],
    );
  }
}
