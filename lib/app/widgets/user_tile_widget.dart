import 'package:flutter/material.dart';
import 'package:git_friend/shared/models/git_user_model.dart';

class UserTileWidget extends StatefulWidget {
  final GitUserModel user;
  final void Function() onPressed;

  const UserTileWidget(
      {required this.user, required this.onPressed, super.key});

  @override
  State<UserTileWidget> createState() => _UserTileWidgetState();
}

class _UserTileWidgetState extends State<UserTileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          backgroundImage: NetworkImage(widget.user.avatar),
        ),
        title: Text('${widget.user.login} ▪️ ${widget.user.name}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('seguidores: ${widget.user.followers}'),
            Text('seguindo: ${widget.user.following}'),
            const Divider(),
          ],
        ),
        horizontalTitleGap: 8,
        onTap: widget.onPressed);
  }
}
