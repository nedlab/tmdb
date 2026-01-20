/// TMDB configuration constants.
///
/// API docs:
/// - Top rated: https://developer.themoviedb.org/reference/movie-top-rated-list
/// - Details: https://developer.themoviedb.org/reference/movie-details
/// - Search: https://developer.themoviedb.org/reference/search-movie
/// - Configuration: https://developer.themoviedb.org/reference/configuration-details
abstract final class TmdbConfig {
  // Base TMDB API URL.
  static const String apiBaseUrl = 'https://api.themoviedb.org/3';

  // Base URL for TMDB images 
  static const String imagesBaseUrl = 'https://image.tmdb.org/t/p/';

  // Top Rated
  static const String topRatedMoviesPath = '/movie/top_rated';
  // Details
  static const String movieDetailsPath = '/movie';
  // Search Movie
  static const String searchMoviePath = '/search/movie';
  // Query the API configuration details
  static const String configurationPath = '/configuration';

  // TMDB API key
  static const String _apiKey = String.fromEnvironment(
    'TMDB_API_KEY',
    defaultValue: '',
  );

  static String get apiKey {
    if (_apiKey.isEmpty) {
      throw StateError(
        'TMDB_API_KEY is not set. Run with --dart-define=TMDB_API_KEY=...',
      );
    }
    return _apiKey;
  }

  // Builds full image URL from TMDB
  static String buildImageUrl({
    required String path,
    required String baseUrl,
    String size = 'w500',
  }) {
    if (path.isEmpty) return '';
    return '$baseUrl$size$path';
  }
}
