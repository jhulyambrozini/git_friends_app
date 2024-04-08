import 'package:auto_injector/auto_injector.dart';
import 'package:git_friend/app/page/favorites/favorites_page_viewmodel.dart';
import 'package:git_friend/app/page/search_user/search_page_viewmodel.dart';
import 'package:git_friend/infrastructure/git_friend_api.dart';
import 'package:git_friend/infrastructure/repositores/api_github_repository.dart';
import 'package:git_friend/infrastructure/repositores/api_github_repository_impl.dart';

class DependencyInjector {
  final injector = AutoInjector();

  DependencyInjector() {
    injector.addSingleton<ApiGitHubRepository>(ApiGitHubRepositoryImpl.new);
    injector.addSingleton(GitFriendsApi.new);

    injector.add(SearchPageViewModel.new);
    injector.add(FavoritesPageViewModel.new);

    // injector
    //     .addSingleton<RequestRepository>(CancellationRequestRepositoryImpl.new);
    // injector.addSingleton<UserRepository>(UserRepositoryImpl.new);
    // injector.addSingleton(GestorAuthApi.new);

    // injector.add(CancellationRequestViewModel.new);
    // injector.add(ConfirmedRequestViewModel.new);
    // injector.add(UserViewModel.new);

    injector.commit();
  }
}
