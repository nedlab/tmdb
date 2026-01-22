import 'package:go_router/go_router.dart';
import 'package:tmdb/app/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/features/movies/presentation/screens/top_movies_screen.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const TopMoviesScreen(),
      routes: [
        GoRoute(
          path: AppRoutes.movieDetails,
          builder: (context, state) => const Placeholder(),
        ),
        GoRoute(
          path: AppRoutes.movieSearch,
          builder: (context, state) => const Placeholder(),
        ), // Nested routes can be added here
      ],
    ),
  ],
  initialLocation: AppRoutes.home,
);
