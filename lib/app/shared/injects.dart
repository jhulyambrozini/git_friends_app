import 'package:git_friend/app/shared/dependency_injector.dart';
import 'package:git_friend/app/views/page/search_user/search_user_page_controller.dart';

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
