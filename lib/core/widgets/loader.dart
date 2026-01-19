import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgLoader extends StatefulWidget {
  final double size;
  final String assetName;

  const SvgLoader({
    super.key,
    this.size = 50.0,
    this.assetName = 'assets/images/Loader.svg',
  });

  @override
  State<SvgLoader> createState() => _SvgLoaderState();
}

class _SvgLoaderState extends State<SvgLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Визначаємо колір залежно від теми
    final color = Theme.of(context).colorScheme.onSurface;

    return RotationTransition(
      turns: _controller,
      child: SvgPicture.asset(
        widget.assetName,
        width: widget.size,
        height: widget.size,
        // Застосовуємо колір до SVG
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}