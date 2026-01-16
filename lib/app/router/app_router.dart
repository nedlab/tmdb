import 'package:go_router/go_router.dart';
import 'package:tmdb/app/router/routes.dart';
import 'package:flutter/material.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const Placeholder(),
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
  initialLocation: AppRoutes.splash,
);
