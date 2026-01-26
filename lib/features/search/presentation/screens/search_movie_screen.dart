import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb/app/router/routes.dart';
import 'package:tmdb/features/favorites/favorites_provider.dart';
import 'package:tmdb/features/movies/presentation/widgets/movie_card.dart';
import 'package:tmdb/features/search/presentation/providers/movie_search_provider.dart';

class SearchMovieScreen extends ConsumerStatefulWidget {
  const SearchMovieScreen({super.key});

  @override
  ConsumerState<SearchMovieScreen> createState() => _SearchMovieScreenState();
}

class _SearchMovieScreenState extends ConsumerState<SearchMovieScreen> {
  late final TextEditingController _controller;
  String _query = '';

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _query;
    final search = ref.watch(movieSearchProvider(query));

    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  _query = value;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest,
                hintText: 'Search',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'assets/images/Search.svg',
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSurfaceVariant,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (query.length >= 3)
              search.maybeWhen(
                data:
                    (movies) => Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Search results (${movies.length})',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                orElse: () => const SizedBox.shrink(),
              ),
            const SizedBox(height: 16),
            Expanded(
              child: search.maybeWhen(
                data: (movies) {
                  if (movies.isEmpty && query.length >= 3) {
                    return Align(
                      alignment: const Alignment(0, -0.75),
                      child: SvgPicture.asset('assets/images/NotFound.svg'),
                    );
                  }
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      const padding = 0.0;
                      const crossAxisCount = 2;
                      const spacing = 16.0;
                      const posterAspectRatio = 163 / 269;

                      final gridWidth = constraints.maxWidth - (padding * 2);
                      final tileWidth =
                          (gridWidth - ((crossAxisCount - 1) * spacing)) /
                          crossAxisCount;

                      final posterHeight = tileWidth / posterAspectRatio;
                      const textAreaHeight = 60.0;
                      final tileHeight = posterHeight + textAreaHeight;

                      return GridView.builder(
                        padding: const EdgeInsets.all(padding),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisExtent: tileHeight,
                          crossAxisSpacing: spacing,
                          mainAxisSpacing: spacing,
                        ),
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          final movie = movies[index];
                          return MovieCard(
                            movie: movie,
                            isFavorite: ref.watch(isFavoriteProvider(movie.id)),
                            onTap: () {
                              final path = AppRoutes.movieDetails.replaceFirst(
                                ':id',
                                movie.id.toString(),
                              );
                              final title = Uri.encodeComponent(movie.title);
                              context.push('$path?title=$title');
                            },
                          );
                        },
                      );
                    },
                  );
                },
                orElse: () => SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
