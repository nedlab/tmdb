import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tmdb/features/movies/domain/movie.dart';
import 'package:tmdb/features/movies/presentation/widgets/movie_poster.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onTap;
  final bool? isFavorite;

  const MovieCard({super.key, required this.movie, this.onTap, this.isFavorite});

  @override
  Widget build(BuildContext context) {
    final posterUrl = movie.posterPath;
    final rating = movie.rating;

    final String? favoriteAsset = switch (isFavorite) {
      true => 'assets/images/StarOn.svg',
      false => 'assets/images/StarOff.svg',
      null => null,
    };

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    MoviePoster(posterUrl: posterUrl),
                    if (favoriteAsset != null)
                      Positioned(
                        top: 12,
                        right: 12,
                        child: SvgPicture.asset(
                          favoriteAsset,
                          width: 20,
                          height: 20,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              movie.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 2),
            Text(
              'Rating: ${rating == null ? '-' : rating.toStringAsFixed(1)}',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
