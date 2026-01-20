import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb/features/movie_details/domain/movie_details.dart';
import 'package:tmdb/features/movies/domain/movie.dart';

void main() {
  group('MovieDetails', () {
    test('is a Movie and maps API keys', () {
      final json = <String, dynamic>{
        'id': 123,
        'title': 'Interstellar',
        'overview': 'A team travels through a wormhole.',
        'poster_path': '/poster.jpg',
        'vote_average': 7.5,
        'release_date': '2020-01-02',
      };

      final details = MovieDetails.fromJson(json);

      expect(details, isA<Movie>());

      expect(details.id, 123);
      expect(details.title, 'Interstellar');
      expect(details.overview, 'A team travels through a wormhole.');
      expect(details.posterPath, '/poster.jpg');
      expect(details.rating, 7.5);

      expect(details.releaseDate, isNotNull);
      expect(details.releaseDate!.year, 2020);
      expect(details.releaseDate!.month, 1);
      expect(details.releaseDate!.day, 2);
    });

    test('toJson includes overview and release_date', () {
      final details = MovieDetails(
        id: 1,
        title: 'Test',
        overview: 'Overview',
        posterPath: null,
        rating: 8.25,
        releaseDate: DateTime(2020, 1, 2),
      );

      final json = details.toJson();

      expect(json['id'], 1);
      expect(json['title'], 'Test');
      expect(json['poster_path'], isNull);
      expect(json['vote_average'], 8.25);
      expect(json['overview'], 'Overview');

      expect(json['release_date'], isA<String>());
      expect((json['release_date'] as String).startsWith('2020-01-02'), isTrue);
    });

    test('round-trip via JSON preserves values', () {
      final original = MovieDetails(
        id: 42,
        title: 'RoundTrip',
        overview: 'O',
        posterPath: '/p.png',
        rating: null,
        releaseDate: null,
      );

      final restored = MovieDetails.fromJson(original.toJson());

      expect(restored.id, original.id);
      expect(restored.title, original.title);
      expect(restored.overview, original.overview);
      expect(restored.posterPath, original.posterPath);
      expect(restored.rating, original.rating);
      expect(restored.releaseDate, original.releaseDate);
    });
  });
}
