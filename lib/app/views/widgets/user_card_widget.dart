import 'package:flutter/material.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Card(
        child: SizedBox(
          width: 320,
          height: 600,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.amber,
                    maxRadius: 50,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'nome da pessoa e @',
                    style: theme.textTheme.displayMedium,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    'Breve descrição',
                    style: theme.textTheme.displaySmall,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {},
                    child: const Text('ADICIONAR AOS FAVORITOS'),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Tecnologias mais utilizadas:',
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 9 * 18,
                    child: ListView.builder(
                      itemBuilder: (ctx, idx) => const Text(
                        'text',
                        style: TextStyle(fontSize: 16),
                      ),
                      itemCount: 7,
                    ),
                  ),
                  Text(
                    'Principais projetos:',
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 9 * 16,
                    child: ListView.builder(
                      itemBuilder: (ctx, idx) => const Text(
                        'testando',
                        style: TextStyle(fontSize: 16),
                      ),
                      itemCount: 6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
