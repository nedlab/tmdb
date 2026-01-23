import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb/features/movies/data/movie_repository_provider.dart';
import 'package:tmdb/features/movie_details/domain/movie_details.dart';
import 'package:tmdb/utils/result.dart' as result;

part 'movie_details_provider.g.dart';


@riverpod
Future<MovieDetails> movieDetails(Ref ref, int id) async {
  final repository = ref.watch(movieRepositoryProvider);

  final repoResult = await repository.getMovieDetails(id);

    return switch (repoResult) {
      result.Ok(value: final response) => response,
      result.Error(error: final e) => throw e,
    };
}
