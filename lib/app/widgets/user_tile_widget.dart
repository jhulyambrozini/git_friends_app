import 'package:flutter/material.dart';
import 'package:git_friend/shared/models/git_user_model.dart';

class UserTileWidget extends StatefulWidget {
  final GitUserModel user;
  final Function() onToggleFavorite;

  const UserTileWidget(
      {required this.user, required this.onToggleFavorite, super.key});

  @override
  State<UserTileWidget> createState() => _UserTileWidgetState();
}

class _UserTileWidgetState extends State<UserTileWidget> {
  Future<dynamic> userCard(BuildContext context, ThemeData theme) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Card(
              child: SizedBox(
                width: 320,
                height: 550,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            maxRadius: 50,
                            backgroundImage: NetworkImage(widget.user.avatar),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: Text(
                            '${widget.user.login} ▪️ ${widget.user.name}',
                            style: theme.textTheme.displayMedium,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: Text(
                            'seguidores: ${widget.user.followers} ▪️ seguindo: ${widget.user.following}',
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '/quantidade de repositórios: ${widget.user.reposQuantity}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        const Divider(),
                        Text(
                          widget.user.description ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Informações de contato:',
                          style: theme.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 4),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '/blog: ${widget.user.blog != '' ? widget.user.blog : 'não informado'}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(width: 18),
                            Text(
                              '/email: ${widget.user.email ?? 'não informado'}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(width: 18),
                            Text(
                              '/twitter: ${widget.user.twitter ?? 'não informado'}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: widget.onToggleFavorite,
                            child: Text(widget.user.isFavorite
                                ? 'REMOVER DOS FAVORITOS'
                                : 'ADICIONAR AOS FAVORITOS'),
                          ),
                        ),
                        // const SizedBox(height: 16),
                        // Text(
                        //   'Repositórios recentes:',
                        //   style: theme.textTheme.bodyLarge,
                        // ),
                        // Text(widget.user.blog),
                        // if (widget.user.reposQuantity != 0)
                        //   SizedBox(
                        //     height: 9 * 18,
                        //     child: ListView.builder(
                        //       itemBuilder: (ctx, idx) => const Text(
                        //         'text',
                        //         style: TextStyle(fontSize: 16),
                        //       ),
                        //       itemCount: 4,
                        //     ),
                        //   )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
      onTap: () {
        userCard(context, theme);
      },
    );
  }
}
