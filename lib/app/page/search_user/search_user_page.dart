import 'package:flutter/material.dart';
import 'package:git_friend/app/page/search_user/search_page_viewmodel.dart';
import 'package:git_friend/app/widgets/card_user_widget.dart';
import 'package:git_friend/app/widgets/custom_snackbar.dart';
import 'package:git_friend/app/widgets/empty_user_list_widget.dart';
import 'package:git_friend/app/widgets/search_input_widget.dart';
import 'package:git_friend/app/widgets/user_tile_widget.dart';
import 'package:git_friend/shared/dependency_injector/dependency_injector.dart';
import 'package:git_friend/shared/models/git_user_model.dart';
import 'package:git_friend/shared/models/git_user_repos_model.dart';
import 'package:git_friend/shared/utils/snackbar_utils.dart';

class SearchUserPage extends StatefulWidget {
  const SearchUserPage({super.key});

  @override
  State<SearchUserPage> createState() => _SearchUserPageState();
}

class _SearchUserPageState extends State<SearchUserPage> {
  late SearchPageViewModel _viewModel;
  final _dependencyInjector = DependencyInjector();

  @override
  void initState() {
    super.initState();
    _viewModel = _dependencyInjector.injector.get<SearchPageViewModel>();
  }

  Future<dynamic> _showUserCard(
      GitUserModel user, List<GitUserReposModel> userRepos) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return UserCardWidget(
            user: user,
            userRepos: userRepos,
            isFavorite: false,
            onToggleFavorite: () async {
              final navigator = Navigator.of(context);

              final result = await _viewModel.setFavoriteUser(userRepos);

              navigator.pop();

              if (result == null) {
                _showErrorSnackBar('Não foi possivel favoritar');
              } else {
                _showSucessSnackBar('Usuário favoritado com sucesso!');
              }
            });
      },
    );
  }

  _showErrorSnackBar(String errorMessage) {
    CustomSnackBar(context).show(SnackBarUtils.error(errorMessage));
  }

  _showSucessSnackBar(String message) {
    CustomSnackBar(context).show(SnackBarUtils.success(message));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListenableBuilder(
      listenable: _viewModel,
      builder: (ctx, _) => SingleChildScrollView(
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
                inputController: _viewModel.inputController,
                onSearch: (value) => {
                      setState(() {
                        _viewModel.inputController.text = value;
                      }),
                      _viewModel.onSearch()
                    }),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 20, bottom: 12),
                  child: Text(
                    'Usuário: ${_viewModel.inputController.text}',
                    style: theme.textTheme.displayMedium,
                  ),
                ),
                if (_viewModel.isUserLoading || _viewModel.isReposLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                if (_viewModel.gitUser == null && _viewModel.isUserError)
                  Center(
                    child: Text(_viewModel.userError),
                  ),
                if (_viewModel.gitUser != null &&
                    !_viewModel.isUserLoading &&
                    !_viewModel.isReposLoading)
                  UserTileWidget(
                    user: _viewModel.gitUser!,
                    onPressed: () async {
                      await _viewModel.onReposSearch();
                      if (!_viewModel.isReposLoading) {
                        _showUserCard(
                            _viewModel.gitUser!, _viewModel.listRepos);
                      }
                    },
                  ),
                if (_viewModel.gitUser == null && !_viewModel.isUserLoading)
                  const EmptyUserListWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
