import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb/features/movies/domain/movie.dart';
import 'package:tmdb/features/movies/data/movie_repository.dart';
import 'package:tmdb/features/movies/data/movie_repository_provider.dart';
import 'package:tmdb/utils/result.dart' as result;

part 'top_movies_provider.g.dart';

class TopRatedMoviesState {
  final List<Movie> movies;
  final int currentPage;
  final int totalPages;

  TopRatedMoviesState({
    this.movies = const [],
    this.currentPage = 1,
    this.totalPages = 1,
  });

  TopRatedMoviesState copyWith({
    List<Movie>? movies,
    int? currentPage,
    int? totalPages,
  }) {
    return TopRatedMoviesState(
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}

@riverpod
class TopRatedMoviesNotifier extends _$TopRatedMoviesNotifier {
  MovieRepository get _repository => ref.read(movieRepositoryProvider);

  @override
  FutureOr<TopRatedMoviesState> build() async {
    return _fetchPage(1);
  }

  Future<TopRatedMoviesState> _fetchPage(int page) async {
    final repoResult = await _repository.getTopRatedMovies(page: page);

    return switch (repoResult) {
      result.Ok(value: final response) => TopRatedMoviesState(
          movies: response.results,
          currentPage: response.page,
          totalPages: response.totalPages,
        ),
      result.Error(error: final e) => throw e,
    };
  }

  Future<void> goToPage(int page) async {
    state = await AsyncValue.guard(() => _fetchPage(page));
  }
}
