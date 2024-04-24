import 'package:flutter/material.dart';
import 'package:git_friend/app/page/favorites/favorites_page_viewmodel.dart';
import 'package:git_friend/app/widgets/card_user_widget.dart';
import 'package:git_friend/app/widgets/empty_user_list_widget.dart';
import 'package:git_friend/app/widgets/user_tile_widget.dart';
import 'package:git_friend/shared/dependency_injector/dependency_injector.dart';
import 'package:git_friend/shared/models/git_user_model.dart';
import 'package:git_friend/shared/models/git_user_repos_model.dart';

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

  Future<dynamic> _showUserCard(
      GitUserModel user, List<GitUserReposModel> userRepos) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return UserCardWidget(
            user: user,
            userRepos: userRepos,
            onToggleFavorite: () => _viewModel.removeFavorite(user.userId));
      },
    );
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
          if (_viewModel.isUserLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (_viewModel.favoriteUsersList.isNotEmpty && _viewModel.isUserError)
            Center(
              child: Text(_viewModel.userError),
            ),
          if (_viewModel.favoriteUsersList.isNotEmpty &&
              !_viewModel.isUserLoading)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                itemCount: _viewModel.favoriteUsersList.length,
                itemBuilder: (context, idx) {
                  final user = _viewModel.favoriteUsersList[idx];
                  return UserTileWidget(
                    user: user,
                    onPressed: () async {
                      await _viewModel.getUsersRepos(user.userId);
                      if (_viewModel.listRepos.isNotEmpty) {
                        _showUserCard(user, _viewModel.listRepos);
                      }
                    },
                  );
                },
              ),
            ),
          const EmptyUserListWidget()
        ],
      ),
    );
  }
}
