import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../config/tmdb_config.dart';

/// Creates a preconfigured [Dio] instance for TMDB API.
///
/// What it configures:
/// - [BaseOptions.baseUrl] = [TmdbConfig.apiBaseUrl]
/// - Timeouts
/// - Interceptor that injects `api_key` (and optional params) into every request
/// - Optional request/response logging in debug/profile builds
Dio createTmdbDio({
  String? language,
  String? region,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: TmdbConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 20),
      responseType: ResponseType.json,
      headers: const {
        'accept': 'application/json',
      },
    ),
  );

  dio.interceptors.add(
    TmdbApiInterceptor(
      apiKey: TmdbConfig.apiKey,
      language: language,
      region: region,
    ),
  );

  if (!kReleaseMode) {
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: false,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        logPrint: (obj) {
          // Keeps logs readable in Flutter and test output.
          debugPrint(obj.toString());
        },
      ),
    );
  }

  return dio;
}

/// TMDB-specific interceptor.
///
/// Injects authentication and common query params.
final class TmdbApiInterceptor extends Interceptor {
  TmdbApiInterceptor({
    required this.apiKey,
    this.language,
    this.region,
  });

  final String apiKey;
  final String? language;
  final String? region;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final qp = <String, dynamic>{...options.queryParameters};

    // TMDB v3 auth via query parameter.
    qp.putIfAbsent('api_key', () => apiKey);

    if (language != null && language!.trim().isNotEmpty) {
      qp.putIfAbsent('language', () => language);
    }

    if (region != null && region!.trim().isNotEmpty) {
      qp.putIfAbsent('region', () => region);
    }

    options.queryParameters
      ..clear()
      ..addAll(qp);

    options.headers.putIfAbsent('accept', () => 'application/json');

    handler.next(options);
  }
}
