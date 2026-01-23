import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb/core/storage/shared_preferences_provider.dart';

part 'favorites_provider.g.dart';

@riverpod
class FavoritesNotifier extends _$FavoritesNotifier {
	static const String _prefsKey = 'favorite_movie_ids';

	@override
	FutureOr<Set<int>> build() async {
		final prefs = await ref.watch(sharedPreferencesProvider.future);
		return _readIdsFromPrefs(prefs);
	}

	Future<void> toggle(int id) async {
		final prefs = await ref.read(sharedPreferencesProvider.future);

		final current = state.asData?.value ?? _readIdsFromPrefs(prefs);
		final next = <int>{...current};

		if (next.contains(id)) {
			next.remove(id);
		} else {
			next.add(id);
		}

		final sorted = next.toList()..sort();
		await prefs.setStringList(
			_prefsKey,
			sorted.map((value) => value.toString()).toList(growable: false),
		);

		state = AsyncData(next);
	}

	Set<int> _readIdsFromPrefs(SharedPreferences prefs) {
		final raw = prefs.getStringList(_prefsKey);
		if (raw == null || raw.isEmpty) return <int>{};
		return raw.map(int.tryParse).whereType<int>().toSet();
	}
}

@riverpod
bool isFavorite(Ref ref, int id) {
	final favorites = ref.watch(favoritesProvider);
	return favorites.maybeWhen(
		data: (ids) => ids.contains(id),
		orElse: () => false,
	);
}

