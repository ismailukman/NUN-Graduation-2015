import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_constants.dart';
import '../../core/constants/asset_paths.dart';
import '../../core/constants/route_names.dart';
import '../../core/utils/audio_manager.dart';

/// Splash screen with animated logo and background audio initialization
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeAndNavigate();
  }

  /// Initialize audio and navigate to officials screen
  Future<void> _initializeAndNavigate() async {
    try {
      final audioManager = AudioManager();
      // Initialize and start music without blocking navigation.
      Future(() async {
        await audioManager.initialize();
        await audioManager.play();
      }).catchError((e) {
        debugPrint('AudioManager: Initialization error - $e');
      });
    } catch (e) {
      debugPrint('AudioManager: Error during initialization - $e');
    }

    // Wait for splash duration
    await Future.delayed(
      Duration(seconds: AppConstants.splashDurationSeconds),
    );

    if (mounted) {
      context.go(RouteNames.officials);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated Logo - NUN Convocation Logo
            Image.asset(
              AssetPaths.logoConvocation,
              width: 200,
              height: 200,
            )
                .animate()
                .fadeIn(duration: 500.ms)
                .scale(
                  begin: const Offset(0.8, 0.8),
                  duration: 1000.ms,
                  curve: Curves.easeOutBack,
                ),

            const SizedBox(height: 32),

            // App Name
            Text(
              AppConstants.appName,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 300.ms, duration: 500.ms),

            const SizedBox(height: 8),

            // Full Name
            Text(
              AppConstants.fullName,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 500.ms, duration: 500.ms),

            const SizedBox(height: 24),

            // Loading Indicator
            SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: theme.colorScheme.primary,
              ),
            ).animate().fadeIn(delay: 700.ms, duration: 500.ms),
          ],
        ),
      ),
    );
  }
}
