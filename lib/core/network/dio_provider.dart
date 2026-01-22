import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb/core/network/tmdb_dio.dart';

part 'dio_provider.g.dart';


@riverpod
Dio dio(Ref ref) => createTmdbDio();