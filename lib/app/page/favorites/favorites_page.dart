import 'package:flutter/material.dart';
import 'package:git_friend/app/page/favorites/favorites_page_viewmodel.dart';
import 'package:git_friend/app/widgets/empty_user_list_widget.dart';
import 'package:git_friend/app/widgets/user_tile_widget.dart';
import 'package:git_friend/shared/dependency_injector/dependency_injector.dart';

class Favoritespage extends StatefulWidget {
  const Favoritespage({super.key});

  @override
  State<Favoritespage> createState() => _FavoritespageState();
}

class _FavoritespageState extends State<Favoritespage> {
  late FavoritesPageViewModel _viewModel;
  final _dependencyInjector = DependencyInjector();

  @override
  void initState() {
    super.initState();
    _viewModel = _dependencyInjector.injector.get<FavoritesPageViewModel>();
  }

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
            child: ListView.builder(
              itemBuilder: (context, idx) => UserTileWidget(
                user: _viewModel.gitUsers[idx],
                onPressed: () {},
              ),
              itemCount: _viewModel.gitUsers.length,
            ),
          ),
          const EmptyUserListWidget()
        ],
      ),
    );
  }
}
