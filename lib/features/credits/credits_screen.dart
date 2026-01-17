import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_constants.dart';
import '../../core/constants/route_names.dart';
import '../../core/utils/audio_manager.dart';

/// Credits screen with auto-scrolling
class CreditsScreen extends StatefulWidget {
  const CreditsScreen({super.key});

  @override
  State<CreditsScreen> createState() => _CreditsScreenState();
}

class _CreditsScreenState extends State<CreditsScreen> {
  final _scrollController = ScrollController();
  bool _userScrolled = false;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();

    // Auto-play graduation music
    _playAudio();

    // Listen for user scroll
    _scrollController.addListener(() {
      if (_scrollController.position.isScrollingNotifier.value &&
          !_userScrolled) {
        setState(() {
          _userScrolled = true;
        });
      }
    });
  }

  /// Auto-play graduation music
  Future<void> _playAudio() async {
    // Delay to allow audio manager to fully initialize and splash to complete
    await Future.delayed(const Duration(seconds: 1));
    try {
      final audioManager = AudioManager();
      // Ensure audio is initialized
      if (!audioManager.isInitialized) {
        await audioManager.initialize();
      }
      // Start playing
      await audioManager.play();
    } catch (e) {
      debugPrint('Credits: Failed to play audio - $e');
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    // Stop audio when leaving credits screen
    AudioManager().stop();
    super.dispose();
  }

  /// Start auto-scroll after delay
  Future<void> _startAutoScroll() async {
    await Future.delayed(
      Duration(seconds: AppConstants.creditsScrollDelaySeconds),
    );

    if (!mounted || _userScrolled) return;

    // Auto-scroll to bottom
    await _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: AppConstants.creditsScrollDurationSeconds),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Credits'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(RouteNames.mainMenu),
          tooltip: 'Back to Main Menu',
        ),
        actions: const [
          SizedBox(width: 8),
        ],
      ),
      body: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.all(24),
        children: [
          // App Title
          Text(
            AppConstants.appName,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 500.ms),

          const SizedBox(height: 8),

          Text(
            'Version ${AppConstants.version}',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(delay: 200.ms, duration: 500.ms),

          const SizedBox(height: 32),

          // University
          _SectionHeader(title: 'University', icon: Icons.school),
          _CreditItem(
            title: AppConstants.fullName,
            subtitle: 'Class of ${AppConstants.graduationYear}',
          ),
          _CreditItem(
            title: AppConstants.previousName,
            subtitle: '(${AppConstants.formerAbbreviation})',
          ),

          const SizedBox(height: 24),

          // Development
          _SectionHeader(title: 'Development', icon: Icons.code),
          const _CreditItem(
            title: 'Ismaila Lukman Enegi (CSc 2015)',
            subtitle: 'Original Android App Developer (2018)',
          ),
          const _CreditItem(
            title: 'Flutter Migration (2025)',
            subtitle: 'Migrated to Flutter with Material Design 3',
          ),

          const SizedBox(height: 24),

          // Contributors
          _SectionHeader(title: 'Special Thanks', icon: Icons.people),
          const _CreditItem(
            title: 'Class of 2015 Graduates',
            subtitle: '${AppConstants.totalStudents} amazing graduates',
          ),
          const _CreditItem(
            title: 'University Officials',
            subtitle: 'Leadership and guidance',
          ),
          const _CreditItem(
            title: 'Department Heads',
            subtitle: 'Academic excellence',
          ),

          const SizedBox(height: 24),

          // Technology
          _SectionHeader(title: 'Built With', icon: Icons.build),
          const _CreditItem(
            title: 'Flutter',
            subtitle: 'Cross-platform framework',
          ),
          const _CreditItem(
            title: 'Material Design 3',
            subtitle: 'Modern UI components',
          ),
          const _CreditItem(title: 'Riverpod', subtitle: 'State management'),
          const _CreditItem(title: 'go_router', subtitle: 'Navigation'),

          const SizedBox(height: 32),

          // Footer
          Divider(color: theme.colorScheme.outlineVariant),
          const SizedBox(height: 16),

          Text(
            'In memory of our graduation day',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontStyle: FontStyle.italic,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            '© ${AppConstants.footerYear} ${AppConstants.universityName}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

/// Section header widget
class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, size: 24, color: theme.colorScheme.primary),
          const SizedBox(width: 12),
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

/// Credit item widget
class _CreditItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const _CreditItem({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
