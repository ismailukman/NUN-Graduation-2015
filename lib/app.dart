import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'core/constants/app_constants.dart';
import 'core/constants/route_names.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/theme_provider.dart';

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

        // Keep web layouts readable by constraining max width.
        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          alignment: Alignment.topCenter,
          child: LayoutBuilder(
            builder: (context, constraints) {
              const maxMobileWidth = 430.0;
              final applySidePadding = constraints.maxWidth > maxMobileWidth;
              final applyVerticalPadding = constraints.maxHeight > 800;
              final mediaQuery = MediaQuery.of(context);
              final effectiveWidth =
                  math.min(mediaQuery.size.width, maxMobileWidth);
              final constrainedMediaQuery = mediaQuery.copyWith(
                size: Size(effectiveWidth, mediaQuery.size.height),
              );
              return ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: maxMobileWidth),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: applySidePadding ? 16 : 0,
                    vertical: applyVerticalPadding ? 12 : 0,
                  ),
                  child: MediaQuery(
                    data: constrainedMediaQuery,
                    child: child,
                  ),
                ),
              );
            },
          ),
        );
      },
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
