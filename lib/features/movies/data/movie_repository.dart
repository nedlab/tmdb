
import 'package:tmdb/features/movie_details/domain/movie_details.dart';
import 'package:tmdb/features/movies/data/models/movie_response.dart';
import 'package:tmdb/features/movies/domain/movie.dart';
import 'package:tmdb/utils/result.dart';
import 'package:tmdb/core/network/api/tmdb_api.dart';
import 'package:tmdb/core/config/tmdb_config.dart';

abstract class MovieRepository {
  Future<Result<MovieResponse>> getTopRatedMovies({int page = 1});

  Future<Result<MovieDetails>> getMovieDetails(int movieId);

  Future<Result<MovieResponse>> searchMovies(String query, {int page = 1});
}

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._api);

  final TmdbApi _api;

  @override
  Future<Result<MovieResponse>> getTopRatedMovies({int page = 1}) async {
    final result = await _api.getTopRatedMovies(page: page);
    return switch (result) {
      Ok(value: final data) => Result.ok(_withAbsoluteImageUrls(data)),
      Error(error: final e) => Result.error(e),
    };
  }

  @override
  Future<Result<MovieDetails>> getMovieDetails(int movieId) async {
    final result = await _api.getMovieDetails(movieId);
    return switch (result) {
      Ok(value: final data) => Result.ok(_withAbsoluteImageUrlsDetails(data)),
      Error(error: final e) => Result.error(e),
    };
  }

  @override
  Future<Result<MovieResponse>> searchMovies(String query, {int page = 1}) async {
    final result = await _api.searchMovies(query, page: page);
    return switch (result) {
      Ok(value: final data) => Result.ok(_withAbsoluteImageUrls(data)),
      Error(error: final e) => Result.error(e),
    };
  }

  MovieResponse _withAbsoluteImageUrls(MovieResponse response) {
    final updated = response.results
        .map(
          (m) => Movie(
            id: m.id,
            title: m.title,
            posterPath: _toAbsoluteImageUrl(m.posterPath),
            rating: m.rating,
          ),
        )
        .toList(growable: false);

    return MovieResponse(
      page: response.page,
      results: updated,
      totalPages: response.totalPages,
      totalResults: response.totalResults,
    );
  }

  MovieDetails _withAbsoluteImageUrlsDetails(MovieDetails details) {
    return MovieDetails(
      id: details.id,
      title: details.title,
      overview: details.overview,
      posterPath: _toAbsoluteImageUrl(details.posterPath),
      rating: details.rating,
      releaseDate: details.releaseDate,
    );
  }

  String? _toAbsoluteImageUrl(String? path) {
    if (path == null) return null;
    final trimmed = path.trim();
    if (trimmed.isEmpty) return trimmed;

    final uri = Uri.tryParse(trimmed);
    if (uri != null && uri.hasScheme) {
      return trimmed;
    }

    final normalizedPath = trimmed.startsWith('/') ? trimmed : '/$trimmed';
    return TmdbConfig.buildImageUrl(
      path: normalizedPath,
      baseUrl: TmdbConfig.imagesBaseUrl,
    );
  }
}