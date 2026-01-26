import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb/app/router/routes.dart';
import 'package:tmdb/features/movies/presentation/providers/top_movies_provider.dart';
import 'package:tmdb/features/movies/presentation/widgets/movies_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmdb/core/widgets/loader.dart' as app_loader;

class TopMoviesScreen extends ConsumerWidget {
  const TopMoviesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(topRatedMoviesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Movies'),
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
        ],
        actionsPadding: EdgeInsets.only(right: 16)
      ),
      body: state.when(
        data:
            (value) => MoviesView(
              movies: value.movies,
              padding: const EdgeInsets.all(16.0),
            ),
        error: (error, _) => Text('Error $error'),
        loading: () => const Center(child: app_loader.SvgLoader()),
      ),
    );
  }
}
