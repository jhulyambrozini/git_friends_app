import 'package:flutter/material.dart';
import 'package:git_friend/shared/models/git_user_model.dart';
import 'package:git_friend/shared/models/git_user_repos_model.dart';

class UserCardWidget extends StatelessWidget {
  final GitUserModel user;
  final List<GitUserReposModel> userRepos;
  final void Function() onToggleFavorite;
  final bool isFavorite;

  const UserCardWidget({
    required this.onToggleFavorite,
    required this.user,
    required this.userRepos,
    required this.isFavorite,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    return Center(
      child: Card(
        child: SizedBox(
          width: screenSize.width * 0.8,
          height: screenSize.height * 0.8,
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
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Text(
                      '${user.login} ▪️ ${user.name}',
                      style: theme.textTheme.displayMedium,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Text(
                      'seguidores: ${user.followers} ▪️ seguindo: ${user.following}',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('/quantidade de repositórios: ${user.reposQuantity}',
                      style: theme.textTheme.bodyMedium),
                  const Divider(),
                  if (user.description != null)
                    Wrap(
                      children: [
                        Text('Descrição:', style: theme.textTheme.bodyLarge),
                        Text(user.description ?? '',
                            style: theme.textTheme.bodyMedium),
                        const SizedBox(height: 24),
                      ],
                    ),
                  Text(
                    'Informações de contato:',
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('/blog: ',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.black87,
                              )),
                          Text(user.blog != '' ? user.blog : 'não informado',
                              style: theme.textTheme.bodyMedium),
                        ],
                      ),
                      const SizedBox(width: 18),
                      Row(
                        children: [
                          Text('/email: ',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.black87,
                              )),
                          Text(user.email ?? 'não informado',
                              style: theme.textTheme.bodyMedium),
                        ],
                      ),
                      const SizedBox(width: 18),
                      Row(
                        children: [
                          Text('/twitter: ',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.black87,
                              )),
                          Text(user.twitter ?? 'não informado',
                              style: theme.textTheme.bodyMedium),
                        ],
                      ),
                    ],
                  ),
                  if (user.reposQuantity != 0)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          'Repositórios:',
                          style: theme.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 4),
                        SizedBox(
                          height: screenSize.height * 0.3,
                          child: ListView.builder(
                              itemCount: userRepos.length,
                              itemBuilder: (ctx, idx) {
                                final repo = userRepos[idx];

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(children: [
                                      Text(
                                        '/nome: ',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Text(repo.name,
                                          style: theme.textTheme.bodyMedium),
                                    ]),
                                    Row(
                                      children: [
                                        Text(
                                          '/linguagem: ',
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                            color: Colors.black87,
                                          ),
                                        ),
                                        Text(repo.language ?? '',
                                            style: theme.textTheme.bodyMedium),
                                      ],
                                    ),
                                    if (userRepos[idx].description != null)
                                      Wrap(
                                        children: [
                                          Text(
                                            '/descrição:',
                                            style: theme.textTheme.bodyMedium
                                                ?.copyWith(
                                              color: Colors.black87,
                                            ),
                                          ),
                                          Text(
                                            repo.description!,
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                        ],
                                      ),
                                    Row(
                                      children: [
                                        Text(
                                          '/criado em: ',
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                            color: Colors.black87,
                                          ),
                                        ),
                                        Text(repo.createdAt ?? '',
                                            style: theme.textTheme.bodyMedium),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '/atualizando em: ',
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(color: Colors.black87),
                                        ),
                                        Text(repo.updatedAt ?? '',
                                            style: theme.textTheme.bodyMedium),
                                      ],
                                    ),
                                    const Divider(),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  const SizedBox(height: 12),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: onToggleFavorite,
                      child: Text(isFavorite
                          ? 'REMOVER DOS FAVORITOS'
                          : 'ADICIONAR AOS FAVORITOS'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
