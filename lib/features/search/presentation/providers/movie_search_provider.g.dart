// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(movieSearch)
final movieSearchProvider = MovieSearchFamily._();

final class MovieSearchProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Movie>>,
          List<Movie>,
          FutureOr<List<Movie>>
        >
    with $FutureModifier<List<Movie>>, $FutureProvider<List<Movie>> {
  MovieSearchProvider._({
    required MovieSearchFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'movieSearchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$movieSearchHash();

  @override
  String toString() {
    return r'movieSearchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Movie>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Movie>> create(Ref ref) {
    final argument = this.argument as String;
    return movieSearch(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieSearchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$movieSearchHash() => r'7a214c14c9dec767c854c62d435e222e1b19edd9';

final class MovieSearchFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Movie>>, String> {
  MovieSearchFamily._()
    : super(
        retry: null,
        name: r'movieSearchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MovieSearchProvider call(String query) =>
      MovieSearchProvider._(argument: query, from: this);

  @override
  String toString() => r'movieSearchProvider';
}
