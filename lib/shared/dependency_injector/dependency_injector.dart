import 'package:auto_injector/auto_injector.dart';
import 'package:dio/dio.dart';
import 'package:git_friend/app/page/favorites/favorites_page_viewmodel.dart';
import 'package:git_friend/app/page/search_user/search_page_viewmodel.dart';
import 'package:git_friend/infrastructure/api/api_client_impl.dart';
import 'package:git_friend/infrastructure/repositores/api_github_repository.dart';
import 'package:git_friend/infrastructure/repositores/api_github_repository_impl.dart';

class DependencyInjector {
  final injector = AutoInjector();

  DependencyInjector() {
    injector.addSingleton<ApiGitHubRepository>(ApiGitHubRepositoryImpl.new);
    injector.addSingleton(ApiClientImpl.new);
    injector.add(() => Dio());

    injector.add(SearchPageViewModel.new);
    injector.add(FavoritesPageViewModel.new);

    injector.commit();
  }
}
