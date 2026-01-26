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
    required (String, int) super.argument,
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
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<Movie>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Movie>> create(Ref ref) {
    final argument = this.argument as (String, int);
    return movieSearch(ref, argument.$1, argument.$2);
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

String _$movieSearchHash() => r'1f93a66c536312689891aec8f3e7c06c3fda3e58';

final class MovieSearchFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Movie>>, (String, int)> {
  MovieSearchFamily._()
    : super(
        retry: null,
        name: r'movieSearchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MovieSearchProvider call(String query, int page) =>
      MovieSearchProvider._(argument: (query, page), from: this);

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
    required (String, int) super.argument,
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
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    final argument = this.argument as (String, int);
    return movieSearchResultsCount(ref, argument.$1, argument.$2);
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
    r'17f36c765090068cb19143fc31bde9deef80402a';

final class MovieSearchResultsCountFamily extends $Family
    with $FunctionalFamilyOverride<int, (String, int)> {
  MovieSearchResultsCountFamily._()
    : super(
        retry: null,
        name: r'movieSearchResultsCountProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MovieSearchResultsCountProvider call(String query, int page) =>
      MovieSearchResultsCountProvider._(argument: (query, page), from: this);

  @override
  String toString() => r'movieSearchResultsCountProvider';
}
