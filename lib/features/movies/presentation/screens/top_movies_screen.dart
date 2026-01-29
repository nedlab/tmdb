import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb/app/router/routes.dart';
import 'package:tmdb/app/theme/theme_provider.dart';
import 'package:tmdb/features/movies/presentation/providers/top_movies_provider.dart';
import 'package:tmdb/features/movies/presentation/widgets/movies_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmdb/core/widgets/loader.dart' as app_loader;

class TopMoviesScreen extends ConsumerWidget {
  const TopMoviesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(topRatedMoviesProvider);
    final themeMode = ref
        .watch(appThemeProvider)
        .maybeWhen(data: (data) => data, orElse: () => ThemeMode.light);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Movies'),
        actions: [
          IconButton(
            onPressed: () => context.push(AppRoutes.movieSearch),
            icon: SvgPicture.asset(
              'assets/images/Search.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.onSurface,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () => ref.read(appThemeProvider.notifier).toggle(),
            icon: SvgPicture.asset(
              ThemeMode.light == themeMode
                  ? 'assets/images/Sun.svg'
                  : 'assets/images/Moon.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.onSurface,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 16),
      ),
      body: state.when(
        data:
            (value) => MoviesView(
              movies: value.movies,
              padding: const EdgeInsets.all(16.0),
              currentPage: value.currentPage,
              totalPages: value.totalPages,
              onPageChanged:
                  (page) =>
                      ref.read(topRatedMoviesProvider.notifier).goToPage(page),
            ),
        error: (error, _) => Text('Error $error'),
        loading: () => const Center(child: app_loader.SvgLoader(size: 80.0)),
      ),
    );
  }
}
