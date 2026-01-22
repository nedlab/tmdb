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
        data: (value) => GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: value.movies.length,
          itemBuilder: (context, index) {
            final movie = value.movies[index];

            return MovieCard(
              movie: movie,
              onTap: () => context.push('/movie-details/${movie.id}'),
            );
          },
        ),
        error: (error, _) => Text('Error $error'),
        loading: () => const Center(child: SvgLoader()),
      ),
    );
  }
}
