import 'package:auto_injector/auto_injector.dart';
import 'package:dio/dio.dart';
import 'package:git_friend/app/page/favorites/favorites_page_viewmodel.dart';
import 'package:git_friend/app/page/home/home_page_viewmodel.dart';
import 'package:git_friend/app/page/search_user/search_page_viewmodel.dart';
import 'package:git_friend/infrastructure/api/api_client_impl.dart';
import 'package:git_friend/infrastructure/database/database_helper.dart';
import 'package:git_friend/infrastructure/database/database_helper_impl.dart';
import 'package:git_friend/infrastructure/database/userDatabaseDao/user_database_dao.dart';
import 'package:git_friend/infrastructure/database/userDatabaseDao/user_database_dao_impl.dart';
import 'package:git_friend/infrastructure/repositores/db_memory_repository/db_memory_repository.dart';
import 'package:git_friend/infrastructure/repositores/db_memory_repository/db_memory_repository_impl.dart';
import 'package:git_friend/infrastructure/repositores/github_repository/api_github_repository.dart';
import 'package:git_friend/infrastructure/repositores/github_repository/api_github_repository_impl.dart';

class DependencyInjector {
  final injector = AutoInjector();

  DependencyInjector() {
    injector.addSingleton<ApiGitHubRepository>(ApiGitHubRepositoryImpl.new);
    injector.addSingleton<DBMemoryRepository>(DBMemoryRepositoryImpl.new);
    injector.addSingleton(ApiClientImpl.new);
    injector.addSingleton<DatabaseHelper>(DatabaseHelperImpl.new);

    injector.add(() => Dio());

    injector.add(SearchPageViewModel.new);
    injector.add(FavoritesPageViewModel.new);
    injector.add(HomePageViewModel.new);

    injector.add<UserDatabaseDAO>(UserDatabaseDAOImpl.new);

    injector.commit();
  }
}
