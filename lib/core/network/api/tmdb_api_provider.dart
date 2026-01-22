import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb/core/network/api/tmdb_api.dart';
import 'package:tmdb/core/network/api/tmdb_api_impl.dart';
import 'package:tmdb/core/network/dio_provider.dart';

part 'tmdb_api_provider.g.dart';

@riverpod
TmdbApi tmdbApi(Ref ref) {
  final dio = ref.watch(dioProvider);
  return TmdbApiImpl(dio);
}

