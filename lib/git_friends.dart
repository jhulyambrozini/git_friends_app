import 'package:flutter/material.dart';
import 'package:git_friend/app/views/page/Home/Home.dart';

class GitFriends extends StatelessWidget {
  const GitFriends({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.white,
      // brightness: systemOverlayStyle,
      // primary: Colors.white10,
      onPrimary: Colors.black87,
      // secondary: secondary,
      // onSecondary: onSecondary,
      // error: error,
      // onError: onError,
      // background: Colors.black12,
      // onBackground: onBackground,
      // surface: surface,
      // onSurface: onSurface,
    );

    return MaterialApp(
      title: 'Git Friends',
      home: const HomePage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: colorScheme.onPrimary,
            // color: Colors.white,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            )),
        colorScheme: colorScheme,
        useMaterial3: true,
      ),
    );
  }
}
