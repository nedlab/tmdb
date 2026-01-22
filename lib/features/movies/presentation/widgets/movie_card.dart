import 'package:flutter/material.dart';
import 'package:tmdb/features/movies/domain/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onTap;

  const MovieCard({
    super.key,
    required this.movie,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final posterUrl = movie.posterPath;
    final rating = movie.rating;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _Poster(posterUrl: posterUrl),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              movie.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              'Rating: ${rating == null ? '-' : rating.toStringAsFixed(1)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _Poster extends StatelessWidget {
  final String? posterUrl;

  const _Poster({required this.posterUrl});

  @override
  Widget build(BuildContext context) {
    if (posterUrl == null || posterUrl!.isEmpty) {
      return const ColoredBox(
        color: Color(0xFF1E1E1E),
        child: Center(
          child: Icon(Icons.image_not_supported_outlined, size: 40),
        ),
      );
    }

    return Image.network(
      posterUrl!,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) {
        return const ColoredBox(
          color: Color(0xFF1E1E1E),
          child: Center(
            child: Icon(Icons.broken_image_outlined, size: 40),
          ),
        );
      },
    );
  }
}
