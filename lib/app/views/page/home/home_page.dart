import 'package:flutter/material.dart';
import 'package:git_friend/app/views/page/favorites/favorites_page.dart';
import 'package:git_friend/app/views/page/search_user/search_user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = [
    const SearchUserPage(),
    const Favoritespage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          iconSize: 32,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
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
        ));
  }
}