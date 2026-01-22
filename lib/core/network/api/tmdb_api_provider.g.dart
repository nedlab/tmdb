// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_api_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tmdbApi)
final tmdbApiProvider = TmdbApiProvider._();

final class TmdbApiProvider
    extends $FunctionalProvider<TmdbApi, TmdbApi, TmdbApi>
    with $Provider<TmdbApi> {
  TmdbApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tmdbApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tmdbApiHash();

  @$internal
  @override
  $ProviderElement<TmdbApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TmdbApi create(Ref ref) {
    return tmdbApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TmdbApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TmdbApi>(value),
    );
  }
}

String _$tmdbApiHash() => r'7b5ab50c6352c8c197b9d98dd41a17a998f48205';
