import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb/core/storage/shared_preferences_provider.dart';

part 'theme_provider.g.dart';

@riverpod
class AppThemeNotifier extends _$AppThemeNotifier {
  static const String _prefsKey = 'theme';

  @override
  FutureOr<ThemeMode> build() async {
    final prefs = await ref.watch(sharedPreferencesProvider.future);
    return _readThemeModeFromPrefs(prefs);
  }

  Future<void> toggle() async {
    final prefs = await ref.read(sharedPreferencesProvider.future);

    final current = state.asData?.value ?? _readThemeModeFromPrefs(prefs);
    final next = switch (current) {
      ThemeMode.dark => ThemeMode.light,
      _ => ThemeMode.dark,
    };

    final nextValue = switch (next) {
      ThemeMode.dark => 'dark',
      ThemeMode.light => 'light',
      _ => 'system',
    };

    await prefs.setString(_prefsKey, nextValue);
    state = AsyncData(next);
  }

  ThemeMode _readThemeModeFromPrefs(SharedPreferences prefs) {
    final mode = prefs.getString(_prefsKey);
    return switch (mode) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => _clarifySystemThemeMode(),
    };
  }

  ThemeMode _clarifySystemThemeMode() {
    return PlatformDispatcher.instance.platformBrightness == Brightness.light
        ? ThemeMode.light
        : ThemeMode.dark;
  }
}
