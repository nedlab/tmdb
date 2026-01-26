// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_movies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TopRatedMoviesNotifier)
final topRatedMoviesProvider = TopRatedMoviesNotifierProvider._();

final class TopRatedMoviesNotifierProvider
    extends
        $AsyncNotifierProvider<TopRatedMoviesNotifier, TopRatedMoviesState> {
  TopRatedMoviesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'topRatedMoviesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$topRatedMoviesNotifierHash();

  @$internal
  @override
  TopRatedMoviesNotifier create() => TopRatedMoviesNotifier();
}

String _$topRatedMoviesNotifierHash() =>
    r'9952a96d6567d8f66cea360d0636f3b424bd77dc';

abstract class _$TopRatedMoviesNotifier
    extends $AsyncNotifier<TopRatedMoviesState> {
  FutureOr<TopRatedMoviesState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<TopRatedMoviesState>, TopRatedMoviesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TopRatedMoviesState>, TopRatedMoviesState>,
              AsyncValue<TopRatedMoviesState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(topMoviesCurrentPage)
final topMoviesCurrentPageProvider = TopMoviesCurrentPageProvider._();

final class TopMoviesCurrentPageProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  TopMoviesCurrentPageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'topMoviesCurrentPageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$topMoviesCurrentPageHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return topMoviesCurrentPage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$topMoviesCurrentPageHash() =>
    r'2f61411f1e121e5fe2597be80e3cb0029755520b';

@ProviderFor(topMoviesTotalPages)
final topMoviesTotalPagesProvider = TopMoviesTotalPagesProvider._();

final class TopMoviesTotalPagesProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  TopMoviesTotalPagesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'topMoviesTotalPagesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$topMoviesTotalPagesHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return topMoviesTotalPages(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$topMoviesTotalPagesHash() =>
    r'5f60a136328bd86e482cf33622dac606ab436158';
