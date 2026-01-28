import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmdb/features/movies/presentation/widgets/movies_view.dart';
import 'package:tmdb/features/search/presentation/providers/movie_search_provider.dart';

class SearchMovieScreen extends ConsumerStatefulWidget {
  const SearchMovieScreen({super.key});

  @override
  ConsumerState<SearchMovieScreen> createState() => _SearchMovieScreenState();
}

class _SearchMovieScreenState extends ConsumerState<SearchMovieScreen> {
  late final TextEditingController _controller;
  String _query = '';

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _query;
    final search = ref.watch(movieSearchProvider(query));

    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  _query = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'assets/images/Search.svg',
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSurfaceVariant,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (query.length >= 3)
              search.maybeWhen(
                data:
                    (movies) => Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Search results (${movies.length})',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                orElse: () => const SizedBox.shrink(),
              ),
            const SizedBox(height: 16),
            Expanded(
              child: search.maybeWhen(
                data: (movies) {
                  if (movies.isEmpty && query.length >= 3) {
                    return Align(
                      alignment: const Alignment(0, -0.75),
                      child: SvgPicture.asset('assets/images/NotFound.svg'),
                    );
                  }
                  return MoviesView(movies: movies);
                },
                orElse: () => SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
