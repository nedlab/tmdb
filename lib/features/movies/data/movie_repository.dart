
import 'package:tmdb/features/movie_details/domain/movie_details.dart';
import 'package:tmdb/features/movies/data/models/movie_response.dart';
import 'package:tmdb/utils/result.dart';
import 'package:tmdb/core/network/api/tmdb_api.dart';

abstract class MovieRepository {
  Future<Result<MovieResponse>> getTopRatedMovies({int page = 1});

  Future<Result<MovieDetails>> getMovieDetails(int movieId);

  Future<Result<MovieResponse>> searchMovies(String query, {int page = 1});
}

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._api);

  final TmdbApi _api;

  @override
  Future<Result<MovieResponse>> getTopRatedMovies({int page = 1}) {
    return _api.getTopRatedMovies(page: page);
  }

  @override
  Future<Result<MovieDetails>> getMovieDetails(int movieId) {
    return _api.getMovieDetails(movieId);
  }

  @override
  Future<Result<MovieResponse>> searchMovies(String query, {int page = 1}) {
    return _api.searchMovies(query, page: page);
  }
}