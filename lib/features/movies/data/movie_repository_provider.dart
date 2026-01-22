import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb/core/network/api/tmdb_api_provider.dart';
import 'package:tmdb/features/movies/data/movie_repository.dart';

part 'movie_repository_provider.g.dart';

@riverpod
MovieRepository movieRepository(Ref ref) {
	final api = ref.watch(tmdbApiProvider);
	return MovieRepositoryImpl(api);
}

