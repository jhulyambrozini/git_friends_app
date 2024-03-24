import 'package:flutter/material.dart';
import 'package:git_friend/app/views/widgets/user_tile_widget.dart';

class Favoritespage extends StatelessWidget {
  const Favoritespage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20, left: 16),
            child: Text(
              'Usuários favoritos',
              style: theme.textTheme.displayLarge,
            ),
          ),
          SizedBox(
            height: 500,
            child: ListView.separated(
              itemBuilder: (context, idx) => const UserTileWidget(),
              itemCount: 5,
              separatorBuilder: (_, __) => const Divider(
                endIndent: 16,
                height: 18,
                indent: 16,
                thickness: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
