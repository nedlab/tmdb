import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  final String? posterUrl;

  const MoviePoster({super.key, required this.posterUrl});

  @override
  Widget build(BuildContext context) {
    final url = posterUrl;

    if (url == null || url.isEmpty) {
      return const ColoredBox(
        color: Color(0xFF1E1E1E),
        child: Center(
          child: Icon(Icons.image_not_supported_outlined, size: 40),
        ),
      );
    }

    return Image.network(
      url,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) {
        return const ColoredBox(
          color: Color(0xFF1E1E1E),
          child: Center(child: Icon(Icons.broken_image_outlined, size: 40)),
        );
      },
    );
  }
}
