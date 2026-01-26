// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoritesNotifier)
final favoritesProvider = FavoritesNotifierProvider._();

final class FavoritesNotifierProvider
    extends $AsyncNotifierProvider<FavoritesNotifier, Set<int>> {
  FavoritesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesNotifierHash();

  @$internal
  @override
  FavoritesNotifier create() => FavoritesNotifier();
}

String _$favoritesNotifierHash() => r'c690f5210284fa6d1945606639a59693adb4208b';

abstract class _$FavoritesNotifier extends $AsyncNotifier<Set<int>> {
  FutureOr<Set<int>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Set<int>>, Set<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Set<int>>, Set<int>>,
              AsyncValue<Set<int>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(isFavorite)
final isFavoriteProvider = IsFavoriteFamily._();

final class IsFavoriteProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsFavoriteProvider._({
    required IsFavoriteFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'isFavoriteProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isFavoriteHash();

  @override
  String toString() {
    return r'isFavoriteProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as int;
    return isFavorite(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsFavoriteProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isFavoriteHash() => r'86f1c9b916399a9cc425fb1cb640027b91d39bb6';

final class IsFavoriteFamily extends $Family
    with $FunctionalFamilyOverride<bool, int> {
  IsFavoriteFamily._()
    : super(
        retry: null,
        name: r'isFavoriteProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsFavoriteProvider call(int id) =>
      IsFavoriteProvider._(argument: id, from: this);

  @override
  String toString() => r'isFavoriteProvider';
}
