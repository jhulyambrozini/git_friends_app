import 'package:flutter/material.dart';
import 'package:git_friend/app/widgets/empty_user_list_widget.dart';
import 'package:git_friend/app/widgets/user_tile_widget.dart';
import 'package:git_friend/infrastructure/storage/git_user_provider.dart';
import 'package:provider/provider.dart';

class Favoritespage extends StatelessWidget {
  const Favoritespage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userProvider = Provider.of<GitUserProvider>(context);

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
          if (userProvider.gitUsers.isNotEmpty)
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemBuilder: (context, idx) => UserTileWidget(
                    user: userProvider.gitUsers[idx],
                    onToggleFavorite: () {
                      userProvider.toggleFavorite(userProvider.gitUsers[idx]);
                      Navigator.of(context).pop();
                    }),
                itemCount: userProvider.gitUsers.length,
              ),
            )
          else
            const EmptyUserListWidget()
        ],
      ),
    );
  }
}
