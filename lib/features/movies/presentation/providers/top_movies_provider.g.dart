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
