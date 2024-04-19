import 'package:flutter/material.dart';
import 'package:git_friend/app/page/favorites/favorites_page.dart';
import 'package:git_friend/app/page/home/home_page_viewmodel.dart';
import 'package:git_friend/app/page/search_user/search_user_page.dart';
import 'package:git_friend/shared/dependency_injector/dependency_injector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _di = DependencyInjector().injector;
  late final HomePageViewModel _viewModel;

  static final List<Widget> _widgetOptions = [
    const SearchUserPage(),
    const Favoritespage(),
  ];

  @override
  void initState() {
    super.initState();
    _viewModel = _di.get<HomePageViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Git Friends'),
        leading: const Icon(Icons.people_alt_outlined),
        backgroundColor: theme.colorScheme.background,
        elevation: 0.5,
      ),
      body: _widgetOptions.elementAt(_viewModel.selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _viewModel.selectedIndex,
        iconSize: 32,
        type: BottomNavigationBarType.fixed,
        onTap: _viewModel.onItemTapped,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: 'favoritos',
            activeIcon: Icon(Icons.star),
            icon: Icon(Icons.star_border_outlined),
          ),
        ],
      ),
    );
  }
}
