import 'package:flutter/material.dart';
import 'package:git_friend/app/page/favorites/favorites_page_viewmodel.dart';
import 'package:git_friend/app/widgets/card_user_widget.dart';
import 'package:git_friend/app/widgets/custom_snackbar.dart';
import 'package:git_friend/app/widgets/empty_user_list_widget.dart';
import 'package:git_friend/app/widgets/user_tile_widget.dart';
import 'package:git_friend/shared/dependency_injector/dependency_injector.dart';
import 'package:git_friend/shared/models/git_user_model.dart';
import 'package:git_friend/shared/models/git_user_repos_model.dart';
import 'package:git_friend/shared/utils/snackbar_utils.dart';

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
    _initUsersList();
  }

  _initUsersList() async {
    await _viewModel.getfavoriteUsersList();
  }

  Future<dynamic> _showUserCard(
      GitUserModel user, List<GitUserReposModel> userRepos) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return UserCardWidget(
            user: user,
            userRepos: userRepos,
            isFavorite: true,
            onToggleFavorite: () async {
              final navigator = Navigator.of(context);
              final result = await _viewModel.removeFavorite(user.userId);

              if (result != null) {
                _showErrorSnackBar(result);
              }

              navigator.pop();
            });
      },
    );
  }

  _showErrorSnackBar(String errorMessage) {
    CustomSnackBar(context).show(SnackBarUtils.error(errorMessage));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: ListenableBuilder(
        listenable: _viewModel,
        builder: (ctx, _) => Column(
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
            if (_viewModel.favoriteUsersList.isNotEmpty &&
                _viewModel.isUserError &&
                !_viewModel.isUserLoading)
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

                        _showUserCard(user, _viewModel.listRepos)
                            .then((_) => _viewModel.getfavoriteUsersList());
                      },
                    );
                  },
                ),
              ),
            if (_viewModel.favoriteUsersList.isEmpty &&
                !_viewModel.isUserLoading)
              const EmptyUserListWidget()
          ],
        ),
      ),
    );
  }
}
