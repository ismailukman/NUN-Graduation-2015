import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'core/constants/app_constants.dart';
import 'core/constants/route_names.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/theme_provider.dart';
import 'core/utils/audio_manager.dart';

// Screen imports
import 'features/splash/splash_screen.dart';
import 'features/officials/officials_screen.dart';
import 'features/main_menu/main_menu_screen.dart';
import 'features/department/department_screen.dart';
import 'features/search/search_screen.dart';
import 'features/credits/credits_screen.dart';

/// Root application widget with theme and routing configuration
class NunGraduationApp extends ConsumerWidget {
  const NunGraduationApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch theme mode from provider
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      // App Configuration
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,

      // Theme Configuration
      theme: AppTheme.lightTheme,
      darkTheme: DarkTheme.darkTheme,
      themeMode: themeMode,

      // Routing Configuration
      routerConfig: _router,
      builder: (context, child) {
        if (!kIsWeb || child == null) {
          return child ?? const SizedBox.shrink();
        }

        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: _WebAudioGate(child: child),
            ),
          ),
        );
      },
    );
  }
}

class _WebAudioGate extends StatefulWidget {
  const _WebAudioGate({required this.child});

  final Widget child;

  @override
  State<_WebAudioGate> createState() => _WebAudioGateState();
}

class _WebAudioGateState extends State<_WebAudioGate> {
  late final AudioManager _audioManager;
  StreamSubscription<bool>? _playingSub;
  bool _showPrompt = true;

  @override
  void initState() {
    super.initState();
    _audioManager = AudioManager();
    _showPrompt = !_audioManager.isPlaying;
    _playingSub = _audioManager.playingStream.listen((isPlaying) {
      if (!mounted) return;
      setState(() {
        _showPrompt = !isPlaying;
      });
    });
  }

  Future<void> _startAudio() async {
    if (!_showPrompt) return;
    await _audioManager.play();
    if (!mounted) return;
    setState(() {
      _showPrompt = false;
    });
  }

  @override
  void dispose() {
    _playingSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_showPrompt)
          Positioned.fill(
            child: Material(
              color: Colors.black54,
              child: InkWell(
                onTap: _startAudio,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.volume_up),
                        SizedBox(width: 8),
                        Text('Tap to start audio'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/// GoRouter configuration for app navigation
final _router = GoRouter(
  initialLocation: RouteNames.splash,
  routes: [
    // Splash Screen
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) => const SplashScreen(),
    ),

    // Officials Screen
    GoRoute(
      path: RouteNames.officials,
      builder: (context, state) => const OfficialsScreen(),
    ),

    // Main Menu Screen
    GoRoute(
      path: RouteNames.mainMenu,
      builder: (context, state) => const MainMenuScreen(),
    ),

    // Department Screen (parameterized)
    GoRoute(
      path: RouteNames.department,
      builder: (context, state) {
        final departmentId = state.pathParameters['id']!;
        return DepartmentScreen(departmentId: departmentId);
      },
    ),

    // Search Screen
    GoRoute(
      path: RouteNames.search,
      builder: (context, state) => const SearchScreen(),
    ),

    // Credits Screen
    GoRoute(
      path: RouteNames.credits,
      builder: (context, state) => const CreditsScreen(),
    ),
  ],
);
