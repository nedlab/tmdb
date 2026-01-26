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

String _$movieSearchHash() => r'77b2d35a572bc514c4aa8b592ecfccc45d21835a';

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

@ProviderFor(movieSearchResultsCount)
final movieSearchResultsCountProvider = MovieSearchResultsCountFamily._();

final class MovieSearchResultsCountProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  MovieSearchResultsCountProvider._({
    required MovieSearchResultsCountFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'movieSearchResultsCountProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$movieSearchResultsCountHash();

  @override
  String toString() {
    return r'movieSearchResultsCountProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    final argument = this.argument as String;
    return movieSearchResultsCount(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MovieSearchResultsCountProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$movieSearchResultsCountHash() =>
    r'b7ebdd8771975a4932f2a4344b45ff4ebbb1c9fc';

final class MovieSearchResultsCountFamily extends $Family
    with $FunctionalFamilyOverride<int, String> {
  MovieSearchResultsCountFamily._()
    : super(
        retry: null,
        name: r'movieSearchResultsCountProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MovieSearchResultsCountProvider call(String query) =>
      MovieSearchResultsCountProvider._(argument: query, from: this);

  @override
  String toString() => r'movieSearchResultsCountProvider';
}
