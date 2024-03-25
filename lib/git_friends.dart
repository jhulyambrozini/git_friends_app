import 'package:flutter/material.dart';
import 'package:git_friend/app/page/home/home_page.dart';
import 'package:git_friend/infrastructure/storage/git_user_provider.dart';
import 'package:provider/provider.dart';

class GitFriends extends StatelessWidget {
  const GitFriends({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.white,
      // brightness: systemOverlayStyle,
      // primary: Colors.deepPurple,
      // onPrimary: Colors.black87,
      // secondary: Colors.amberAccent,
      // tertiary: Colors.blueAccent,
      // onSecondary: onSecondary,
      // error: error,
      // onError: onError,
      background: const Color.fromARGB(255, 245, 245, 245),
      // onBackground: onBackground,
      // surface: surface,
      // onSurface: onSurface,
    );

    return ChangeNotifierProvider(
      create: (context) => GitUserProvider(),
      child: MaterialApp(
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
            displaySmall: TextStyle(fontSize: 18, color: Colors.black54),
            bodyLarge: TextStyle(fontSize: 18),
            bodyMedium: TextStyle(fontSize: 16),
            bodySmall: TextStyle(fontSize: 12),
          ),
          useMaterial3: true,
          colorScheme: colorScheme,
        ),
      ),
    );
  }
}
