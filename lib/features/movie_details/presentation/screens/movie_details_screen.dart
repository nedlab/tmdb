import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailsScreen extends ConsumerWidget{
  const MovieDetailsScreen({super.key, required this.movieId, required this.movieTitle});
  final int movieId;
  final String movieTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(movieTitle)),
      body: Placeholder());
  }
}