import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb/app/router/routes.dart';
import 'package:tmdb/features/favorites/favorites_provider.dart';
import 'package:tmdb/features/movies/domain/movie.dart';
import 'package:tmdb/features/movies/presentation/widgets/movie_card.dart';

class MoviesView extends ConsumerWidget {
  final List<Movie> movies;
  final EdgeInsetsGeometry padding;

  const MoviesView({
    super.key,
    required this.movies,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const crossAxisCount = 2;
        const spacing = 16.0;
        const posterAspectRatio = 163 / 233;

        // Calculate expected padding width to subtract from total width for column width calculation
        final double horizontalPadding = padding.horizontal;

        final gridWidth = constraints.maxWidth - horizontalPadding;
        final tileWidth =
            (gridWidth - ((crossAxisCount - 1) * spacing)) / crossAxisCount;

        final posterHeight = tileWidth / posterAspectRatio;
        const textAreaHeight = 60.0;
        final tileHeight = posterHeight + textAreaHeight;

        return GridView.builder(
          padding: padding,
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
  }
}
