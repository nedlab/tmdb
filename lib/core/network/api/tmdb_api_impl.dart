import 'package:dio/dio.dart';
import 'package:tmdb/core/config/tmdb_config.dart';
import 'package:tmdb/core/network/api/tmdb_api.dart';
import 'package:tmdb/features/movie_details/domain/movie_details.dart';
import 'package:tmdb/features/movies/data/models/movie_response.dart';
import 'package:tmdb/utils/result.dart';

/// Dio-based implementation of TmdbApi
final class TmdbApiImpl implements TmdbApi {
  TmdbApiImpl(this._dio);

  final Dio _dio;

  // TODO: Make configurable via /configuration endpoint
  String get imagesBaseUrl => TmdbConfig.imagesBaseUrl;

  @override
  Future<Result<MovieResponse>> getTopRatedMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) {
    return _guard(() async {
      final response = await _dio.get<dynamic>(
        TmdbConfig.topRatedMoviesPath,
        queryParameters: <String, dynamic>{'page': page},
        cancelToken: cancelToken,
      );

      final json = _expectMap(response.data);
      return MovieResponse.fromJson(json);
    });
  }

  @override
  Future<Result<MovieDetails>> getMovieDetails(
    int movieId, {
    CancelToken? cancelToken,
  }) {
    return _guard(() async {
      final response = await _dio.get<dynamic>(
        '${TmdbConfig.movieDetailsPath}/$movieId',
        cancelToken: cancelToken,
      );

      final json = _expectMap(response.data);
      return MovieDetails.fromJson(json);
    });
  }

  @override
  Future<Result<MovieResponse>> searchMovies(
    String query, {
    int page = 1,
    CancelToken? cancelToken,
  }) {
    return _guard(() async {
      final response = await _dio.get<dynamic>(
        TmdbConfig.searchMoviePath,
        queryParameters: <String, dynamic>{'query': query, 'page': page},
        cancelToken: cancelToken,
      );

      final json = _expectMap(response.data);
      return MovieResponse.fromJson(json);
    });
  }

  Future<Result<T>> _guard<T>(Future<T> Function() action) async {
    try {
      final value = await action();
      return Result.ok(value);
    } on DioException catch (e) {
      return Result.error(_mapDioException(e));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Exception _mapDioException(DioException e) {
    final status = e.response?.statusCode;
    if (e.type == DioExceptionType.cancel) {
      return Exception('Request cancelled');
    }

    final message = switch (status) {
      401 => 'Unauthorized (check TMDB_API_KEY)',
      404 => 'Not found',
      429 => 'Rate limited',
      _ => 'Network error',
    };

    final details = e.message;
    return Exception(
      status == null
          ? message
          : '$message (HTTP $status)${details == null ? '' : ': $details'}',
    );
  }

  Map<String, dynamic> _expectMap(Object? data) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    throw const FormatException('Invalid JSON payload: expected object');
  }
}
