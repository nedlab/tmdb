import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb/core/widgets/loader.dart';
import 'package:tmdb/features/movies/presentation/providers/top_movies_provider.dart';

class TopMoviesScreen extends ConsumerWidget {
  const TopMoviesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(topRatedMoviesProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Top Rated Movies')),
      body: state.when(
        data: (value) => Text('Pages: ${value.totalPages}'),
        error: (error, _) => Text('Error $error'),
        loading: () => const Center(child: SvgLoader()),
      ),
    );
  }
}
