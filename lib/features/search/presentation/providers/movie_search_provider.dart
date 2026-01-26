import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb/features/movies/data/movie_repository_provider.dart';
import 'package:tmdb/features/movies/domain/movie.dart';
import 'package:tmdb/features/movies/presentation/providers/top_movies_provider.dart';
import 'package:tmdb/utils/result.dart' as result;

part 'movie_search_provider.g.dart';

@riverpod
Future<List<Movie>> movieSearch(Ref ref, String query) async {
  if (query.trim().length < 3) {
    return [];
  }

  final cancelToken = CancelToken();
  var cancelled = false;

  ref.onDispose(() {
    cancelled = true;
    cancelToken.cancel('Canceled');
  });

  // Debounce: delay before request
  await Future<void>.delayed(const Duration(milliseconds: 500));
  if (cancelled) return [];

  final page = ref.watch(topMoviesCurrentPageProvider);

  final repository = ref.watch(movieRepositoryProvider);
  final repoResult = await repository.searchMovies(
    query,
    page: page,
    cancelToken: cancelToken,
  );

  return switch (repoResult) {
    result.Ok(value: final response) => response.results,
    result.Error(error: final e) => throw e,
  };
}
