import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb/features/movies/domain/movie.dart';

void main() {
  group('Movie', () {
    test('fromJson maps API keys and types', () {
      final json = <String, dynamic>{
        'id': 123,
        'title': 'Interstellar',
        'overview': 'A team travels through a wormhole.',
        'poster_path': '/poster.jpg',
        'vote_average': 7.5,
        'release_date': '2020-01-02',
      };

      final movie = Movie.fromJson(json);

      expect(movie.id, 123);
      expect(movie.title, 'Interstellar');
      expect(movie.overview, 'A team travels through a wormhole.');
      expect(movie.posterPath, '/poster.jpg');
      expect(movie.rating, 7.5);

      expect(movie.releaseDate, isNotNull);
      expect(movie.releaseDate!.year, 2020);
      expect(movie.releaseDate!.month, 1);
      expect(movie.releaseDate!.day, 2);
    });

    test('toJson uses API keys', () {
      final movie = Movie(
        id: 1,
        title: 'Test',
        overview: 'Overview',
        posterPath: null,
        rating: 8.25,
        releaseDate: DateTime(2020, 1, 2),
      );

      final json = movie.toJson();

      expect(json['id'], 1);
      expect(json['title'], 'Test');
      expect(json['overview'], 'Overview');
      expect(json.containsKey('poster_path'), isTrue);
      expect(json['poster_path'], isNull);
      expect(json['vote_average'], 8.25);

      expect(json['release_date'], isA<String>());
      expect((json['release_date'] as String).startsWith('2020-01-02'), isTrue);
    });

    test('round-trip via JSON preserves values', () {
      final original = Movie(
        id: 42,
        title: 'RoundTrip',
        overview: 'O',
        posterPath: '/p.png',
        rating: null,
        releaseDate: null,
      );

      final restored = Movie.fromJson(original.toJson());

      expect(restored.id, original.id);
      expect(restored.title, original.title);
      expect(restored.overview, original.overview);
      expect(restored.posterPath, original.posterPath);
      expect(restored.rating, original.rating);
      expect(restored.releaseDate, original.releaseDate);
    });
  });
}
