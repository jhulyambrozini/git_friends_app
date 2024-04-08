import 'package:flutter/material.dart';
import 'package:git_friend/shared/models/git_user_model.dart';
import 'package:git_friend/shared/models/git_user_repos_model.dart';

class UserCardWidget extends StatelessWidget {
  final GitUserModel user;
  final List<GitUserReposModel> userRepos;
  final void Function() onToggleFavorite;

  const UserCardWidget({
    required this.onToggleFavorite,
    required this.user,
    required this.userRepos,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text(
                          '/blog: ${user.blog != '' ? user.blog : 'não informado'}',
                          style: theme.textTheme.bodyMedium),
                      const SizedBox(width: 18),
                      Text('/email: ${user.email ?? 'não informado'}',
                          style: theme.textTheme.bodyMedium),
                      const SizedBox(width: 18),
                      Text('/twitter: ${user.twitter ?? 'não informado'}',
                          style: theme.textTheme.bodyMedium),
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
                          height: userRepos.length * 20,
                          child: ListView.builder(
                              itemCount: userRepos.length,
                              itemBuilder: (ctx, idx) {
                                final repo = userRepos[idx];

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('/nome: ${repo.name}',
                                        style: theme.textTheme.bodyMedium),
                                    Text('/linguagem: ${repo.language ?? ''}',
                                        style: theme.textTheme.bodyMedium),
                                    if (userRepos[idx].description != null)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('/descrição:',
                                              style:
                                                  theme.textTheme.bodyMedium),
                                          Text(
                                            repo.description!,
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                        ],
                                      ),
                                    Text('/criado em: ${repo.createdAt ?? ''}',
                                        style: theme.textTheme.bodyMedium),
                                    Text(
                                        '/atualizando em: ${repo.updatedAt ?? ''}',
                                        style: theme.textTheme.bodyMedium),
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
                      child: Text(user.isFavorite
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
