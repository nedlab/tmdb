// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(movieDetails)
final movieDetailsProvider = MovieDetailsFamily._();

final class MovieDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<MovieDetails>,
          MovieDetails,
          FutureOr<MovieDetails>
        >
    with $FutureModifier<MovieDetails>, $FutureProvider<MovieDetails> {
  MovieDetailsProvider._({
    required MovieDetailsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'movieDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$movieDetailsHash();

  @override
  String toString() {
    return r'movieDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<MovieDetails> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MovieDetails> create(Ref ref) {
    final argument = this.argument as int;
    return movieDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$movieDetailsHash() => r'742b71d2f1caa931296e2f3536e27fe1fc7a51a7';

final class MovieDetailsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<MovieDetails>, int> {
  MovieDetailsFamily._()
    : super(
        retry: null,
        name: r'movieDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MovieDetailsProvider call(int id) =>
      MovieDetailsProvider._(argument: id, from: this);

  @override
  String toString() => r'movieDetailsProvider';
}
