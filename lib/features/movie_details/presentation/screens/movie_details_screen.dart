import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb/features/favorites/favorites_provider.dart';
import 'package:tmdb/features/favorites/presentation/widgets/favorites_button.dart';
import 'package:tmdb/features/movie_details/presentation/providers/movie_details_provider.dart';
import 'package:tmdb/features/movies/presentation/widgets/movie_poster.dart';

class MovieDetailsScreen extends ConsumerWidget {
  const MovieDetailsScreen({
    super.key,
    required this.movieId,
    required this.movieTitle,
  });
  final int movieId;
  final String movieTitle;

  String _formatRating(double? rating) {
    final value = rating;
    if (value == null) return '-';
    final fixed = value.toStringAsFixed(1);
    return fixed.endsWith('.0') ? fixed.substring(0, fixed.length - 2) : fixed;
  }

  String _formatReleaseDate(DateTime? date) {
    final value = date;
    if (value == null) return '';

    const months = <String>[
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    final monthName = months[value.month - 1];
    return '${value.day} $monthName ${value.year}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(movieDetailsProvider(movieId));
    final favorites = ref.watch(favoritesProvider);
    return Scaffold(
      appBar: AppBar(title: Text(movieTitle)),
      body: details.when(
        data: (movie) {
          final double posterWidth = (MediaQuery.sizeOf(context).width * 0.72)
              .clamp(250.0, 357.0);
          final double posterHeight = posterWidth * (357.0/250.0); // 2:3 poster ratio

          final releaseDateText = _formatReleaseDate(movie.releaseDate);

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: SizedBox(
                        width: posterWidth,
                        height: posterHeight,
                        child: MoviePoster(posterUrl: movie.posterPath),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rating: ${_formatRating(movie.rating)}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    movie.overview,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  if (releaseDateText.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    Text(
                      releaseDateText,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 0),
                    Center(
                      child: favorites.when(
                        data: (ids) => FavoritesButton(
                          isFavorite: ids.contains(movieId),
                          onPressed: () {
                            ref.read(favoritesProvider.notifier).toggle(movieId);
                          },
                        ),
                        loading: () => const SizedBox.shrink(),
                        error: (error, stackTrace) => const SizedBox.shrink(),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
        loading: () => const SizedBox.shrink(),
        error: (error, stackTrace) => const SizedBox.shrink(),
      ),
    );
  }
}
