import 'package:flutter/material.dart';
import 'package:git_friend/app/page/home/home_page.dart';

class GitFriends extends StatelessWidget {
  const GitFriends({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.white,
      background: const Color.fromARGB(255, 245, 245, 245),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Git Friends',
      home: const HomePage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 24,
          ),
          iconTheme: const IconThemeData(
            size: 30,
            color: Colors.black87,
          ),
          titleSpacing: 0,
          backgroundColor: colorScheme.background,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 20),
          bodyLarge: TextStyle(fontSize: 18),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        useMaterial3: true,
        colorScheme: colorScheme,
      ),
    );
  }
}
