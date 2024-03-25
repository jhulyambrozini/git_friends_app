import 'package:git_friend/shared/dependency_injector/dependency_injector.dart';
import 'package:git_friend/app/page/search_user/search_user_page_controller.dart';

class Injects {
  static initialize() {
    final injector = DependencyInjectorImpl();
    final instance = injector.instance;

    instance.add<SearchUserPageController>(
      SearchUserPageController.new,
    );

    instance.finish();
  }
}
