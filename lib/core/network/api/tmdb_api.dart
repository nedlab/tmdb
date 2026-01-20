import 'package:dio/dio.dart';
import 'package:tmdb/features/movie_details/domain/movie_details.dart';
import 'package:tmdb/features/movies/data/models/movie_response.dart';
import 'package:tmdb/utils/result.dart';

abstract class TmdbApi {
  Future<Result<MovieResponse>> getTopRatedMovies({
    int page = 1,
    CancelToken? cancelToken,
  });

  Future<Result<MovieDetails>> getMovieDetails(
    int movieId, {
    CancelToken? cancelToken,
  });

  Future<Result<MovieResponse>> searchMovies(
    String query, {
    int page = 1,
    CancelToken? cancelToken,
  });
}