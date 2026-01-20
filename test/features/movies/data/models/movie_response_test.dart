import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb/features/movies/data/models/movie_response.dart';
import 'package:tmdb/features/movies/domain/movie.dart';

void main() {
  group('MovieResponse', () {
    test('fromJson maps API keys and nested movies', () {
      final json = <String, dynamic>{
        'page': 2,
        'results': [
          {
            'id': 10,
            'title': 'Movie A',
            'poster_path': '/a.jpg',
            'vote_average': 8.1,
          },
          {
            'id': 11,
            'title': 'Movie B',
            'poster_path': null,
            'vote_average': null,
          },
        ],
        'total_pages': 100,
        'total_results': 2000,
        // Extra keys should not break parsing.
        'some_other_key': 'ignored',
      };

      final response = MovieResponse.fromJson(json);

      expect(response.page, 2);
      expect(response.totalPages, 100);
      expect(response.totalResults, 2000);

      expect(response.results, hasLength(2));
      expect(response.results.first, isA<Movie>());

      expect(response.results[0].id, 10);
      expect(response.results[0].title, 'Movie A');
      expect(response.results[0].posterPath, '/a.jpg');
      expect(response.results[0].rating, 8.1);

      expect(response.results[1].id, 11);
      expect(response.results[1].title, 'Movie B');
      expect(response.results[1].posterPath, isNull);
      expect(response.results[1].rating, isNull);
    });

    test('toJson uses API keys', () {
      final response = MovieResponse(
        page: 1,
        results: [
          Movie(id: 1, title: 'T1', posterPath: '/p.png', rating: 7.0),
        ],
        totalPages: 2,
        totalResults: 40,
      );

      final json = response.toJson();

      expect(json['page'], 1);
      expect(json['total_pages'], 2);
      expect(json['total_results'], 40);

      expect(json['results'], isA<List<dynamic>>());
      expect((json['results'] as List).length, 1);

      final first = (json['results'] as List).first as Map<String, dynamic>;
      expect(first['id'], 1);
      expect(first['title'], 'T1');
      expect(first.containsKey('poster_path'), isTrue);
      expect(first['poster_path'], '/p.png');
      expect(first['vote_average'], 7.0);
    });

    test('round-trip via JSON preserves values', () {
      final original = MovieResponse(
        page: 3,
        results: [
          Movie(id: 42, title: 'RoundTrip', posterPath: null, rating: null),
        ],
        totalPages: 9,
        totalResults: 123,
      );

      final restored = MovieResponse.fromJson(original.toJson());

      expect(restored.page, original.page);
      expect(restored.totalPages, original.totalPages);
      expect(restored.totalResults, original.totalResults);
      expect(restored.results, hasLength(1));

      final restoredMovie = restored.results.single;
      expect(restoredMovie.id, 42);
      expect(restoredMovie.title, 'RoundTrip');
      expect(restoredMovie.posterPath, isNull);
      expect(restoredMovie.rating, isNull);
    });
  });
}
