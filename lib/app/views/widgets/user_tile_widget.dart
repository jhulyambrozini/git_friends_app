import 'package:flutter/material.dart';
import 'package:git_friend/app/views/widgets/user_card_widget.dart';

class UserTileWidget extends StatefulWidget {
  const UserTileWidget({super.key});

  @override
  State<UserTileWidget> createState() => _UserTileWidgetState();
}

class _UserTileWidgetState extends State<UserTileWidget> {
  Future<dynamic> userCard(BuildContext context, ThemeData theme) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return const UserCardWidget();
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.amber,
        maxRadius: 35,
      ),
      title: const Text('nome da pessoa e @'),
      subtitle: const Text('seguidores'),
      horizontalTitleGap: 8,
      onTap: () {
        userCard(context, theme);
      },
    );
  }
}
