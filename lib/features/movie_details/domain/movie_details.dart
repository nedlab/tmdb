import 'package:json_annotation/json_annotation.dart';

import '../../movies/domain/movie.dart';

part 'movie_details.g.dart';

@JsonSerializable()
class MovieDetails extends Movie {
  final String overview;

  @JsonKey(name: 'release_date')
  final DateTime? releaseDate;

  MovieDetails({
    required super.id,
    required super.title,
    required this.overview,
    super.posterPath,
    super.rating,
    this.releaseDate,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}
