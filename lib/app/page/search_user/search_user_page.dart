import 'package:flutter/material.dart';
import 'package:git_friend/app/page/search_user/search_user_page_controller.dart';
import 'package:git_friend/app/widgets/empty_user_list_widget.dart';
import 'package:git_friend/app/widgets/search_input_widget.dart';
import 'package:git_friend/app/widgets/user_tile_widget.dart';
import 'package:git_friend/infrastructure/storage/git_user_provider.dart';
import 'package:provider/provider.dart';

class SearchUserPage extends StatelessWidget {
  final SearchUserPageController _controller;
  const SearchUserPage(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userProvider = Provider.of<GitUserProvider>(context);

    return ValueListenableBuilder(
      valueListenable: _controller.userSearch,
      builder: (ctx, model, child) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20, left: 16),
              child: Text(
                'Busca por usuário',
                style: theme.textTheme.displayLarge,
              ),
            ),
            SearchInputWidget(
                onSearch: (value) => _controller.setUserSearch(value)),
            ValueListenableBuilder(
              valueListenable: _controller.user,
              builder: (context, user, child) {
                if (user != null) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 20, bottom: 12),
                          child: Text(
                            'Usuário: ${_controller.userSearch.value}',
                            style: theme.textTheme.displayMedium,
                          )),
                      SizedBox(
                        height: (98 * 1)
                            .toDouble(), // Ajuste a altura conforme o número de usuários
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, idx) => UserTileWidget(
                              user: user,
                              onToggleFavorite: () {
                                userProvider.toggleFavorite(user);
                                Navigator.of(context).pop();
                              }),
                        ),
                      )
                    ],
                  );
                } else {
                  return const EmptyUserListWidget();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
