import 'package:flutter/material.dart';
import 'package:git_friend/app/views/page/search_user/search_user_page_controller.dart';
import 'package:git_friend/app/views/widgets/search_input_widget.dart';
import 'package:git_friend/app/views/widgets/user_tile_widget.dart';
import 'package:provider/provider.dart';

class SearchUserPage extends StatelessWidget {
  const SearchUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ChangeNotifierProvider(
      create: (_) => SearchUserPageController(),
      child: SingleChildScrollView(
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
            Consumer<SearchUserPageController>(
                builder: (context, controller, _) {
              return SearchInputWidget(
                  onSearch: (value) => controller.setUserSearch(value));
            }),
            Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 20, bottom: 12),
                child: Consumer<SearchUserPageController>(
                    builder: (context, controller, _) {
                  return Text(
                    'Listagem de usuários: ${controller.userSearch}',
                    style: theme.textTheme.displayMedium,
                  );
                })),
            SizedBox(
              height: 98 * 5,
              child: ListView.separated(
                itemBuilder: (context, idx) => const UserTileWidget(),
                itemCount: 6,
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
      ),
    );
  }
}
