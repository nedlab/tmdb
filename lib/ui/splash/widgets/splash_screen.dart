import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb/app/router/routes.dart';
import 'package:tmdb/ui/core/widgets/loader.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goHomeAfterDelay();
  }

  void _goHomeAfterDelay() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      context.go(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SvgLoader(size: 80.0),
      ),
    );
  }
}
