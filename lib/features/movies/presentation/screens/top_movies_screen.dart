import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb/core/widgets/loader.dart';
import 'package:tmdb/features/movies/presentation/providers/top_movies_provider.dart';
import 'package:tmdb/features/movies/presentation/widgets/movie_card.dart';

class TopMoviesScreen extends ConsumerWidget {
  const TopMoviesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(topRatedMoviesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Top Rated Movies')),
      body: state.when(
        data: (value) => LayoutBuilder(
          builder: (context, constraints) {
            const padding = 16.0;
            const crossAxisCount = 2;
            const spacing = 16.0;
            const posterAspectRatio = 163 / 269;

            final gridWidth = constraints.maxWidth - (padding * 2);
            final tileWidth =
                (gridWidth - ((crossAxisCount - 1) * spacing)) / crossAxisCount;

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
              itemCount: value.movies.length,
              itemBuilder: (context, index) {
                final movie = value.movies[index];

                return MovieCard(
                  movie: movie,
                  onTap: () => context.push('/movie-details/${movie.id}'),
                );
              },
            );
          },
        ),
        error: (error, _) => Text('Error $error'),
        loading: () => const Center(child: SvgLoader()),
      ),
    );
  }
}
