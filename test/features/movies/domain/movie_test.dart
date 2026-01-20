import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb/features/movies/domain/movie.dart';

void main() {
  group('Movie', () {
    test('fromJson maps API keys and types', () {
      final json = <String, dynamic>{
        'id': 123,
        'title': 'Interstellar',
        'poster_path': '/poster.jpg',
        'vote_average': 7.5,
        // Extra keys should not break parsing.
        'overview': 'A team travels through a wormhole.',
        'release_date': '2020-01-02',
      };

      final movie = Movie.fromJson(json);

      expect(movie.id, 123);
      expect(movie.title, 'Interstellar');
      expect(movie.posterPath, '/poster.jpg');
      expect(movie.rating, 7.5);
    });

    test('toJson uses API keys', () {
      final movie = Movie(
        id: 1,
        title: 'Test',
        posterPath: null,
        rating: 8.25,
      );

      final json = movie.toJson();

      expect(json['id'], 1);
      expect(json['title'], 'Test');
      expect(json.containsKey('poster_path'), isTrue);
      expect(json['poster_path'], isNull);
      expect(json['vote_average'], 8.25);

      expect(json.containsKey('overview'), isFalse);
      expect(json.containsKey('release_date'), isFalse);
    });

    test('round-trip via JSON preserves values', () {
      final original = Movie(
        id: 42,
        title: 'RoundTrip',
        posterPath: '/p.png',
        rating: null,
      );

      final restored = Movie.fromJson(original.toJson());

      expect(restored.id, original.id);
      expect(restored.title, original.title);
      expect(restored.posterPath, original.posterPath);
      expect(restored.rating, original.rating);
    });
  });
}
