import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/audio/audio_control_button.dart';
import '../../core/constants/route_names.dart';
import '../../core/theme/theme_provider.dart';
import '../../data/repositories/data_repository.dart';

/// Main menu screen with department grid
class MainMenuScreen extends ConsumerWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final themeNotifier = ref.read(themeModeProvider.notifier);
    final departments = DataRepository.allDepartments;

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Departments'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(RouteNames.officials),
          tooltip: 'Back to Officials',
        ),
        actions: [
          // Audio Control
          const AudioControlButton(),

          // Theme Toggle
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => themeNotifier.toggleTheme(),
            tooltip: isDarkMode ? 'Light Mode' : 'Dark Mode',
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: departments.length + 1, // +1 for credits button
        itemBuilder: (context, index) {
          // Credits button as last item
          if (index == departments.length) {
            return _MenuCard(
              title: 'Credits',
              subtitle: 'Contributors',
              icon: Icons.info_outline,
              onTap: () => context.go(RouteNames.credits),
              index: index,
            );
          }

          final department = departments[index];
          return _DepartmentCard(
            title: department.shortName,
            subtitle: '${department.studentCount} Graduates',
            logoPath: department.logoAssetPath,
            onTap: () => context.go(
              RouteNames.departmentRoute(department.id),
            ),
            index: index,
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go(RouteNames.search),
        icon: const Icon(Icons.search),
        label: const Text('Search Graduates'),
      )
          .animate()
          .fadeIn(delay: 500.ms, duration: 500.ms)
          .scale(delay: 500.ms),
    );
  }
}

/// Department card widget
class _DepartmentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String logoPath;
  final VoidCallback onTap;
  final int index;

  const _DepartmentCard({
    required this.title,
    required this.subtitle,
    required this.logoPath,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.colorScheme.primaryContainer.withOpacity(0.4),
                theme.colorScheme.surface,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Department Name - Large and Centered
                Flexible(
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 16),

                // Student Count Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.primary.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(delay: (50 * index).ms, duration: 400.ms)
        .scale(begin: const Offset(0.8, 0.8), delay: (50 * index).ms);
  }
}

/// Generic menu card (for credits)
class _MenuCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final int index;

  const _MenuCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 80,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(delay: (50 * index).ms, duration: 400.ms)
        .scale(begin: const Offset(0.8, 0.8), delay: (50 * index).ms);
  }
}
