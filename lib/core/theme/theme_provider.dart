import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provider for theme mode state with persistence
final themeModeProvider =
    NotifierProvider<ThemeModeNotifier, ThemeMode>(() {
  return ThemeModeNotifier();
});

/// Notifier for managing theme mode with SharedPreferences persistence
class ThemeModeNotifier extends Notifier<ThemeMode> {
  static const String _themeModeKey = 'theme_mode';

  @override
  ThemeMode build() {
    _loadTheme();
    return ThemeMode.system;
  }

  /// Load saved theme preference from SharedPreferences
  Future<void> _loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeModeString = prefs.getString(_themeModeKey);

      if (themeModeString != null) {
        state = ThemeMode.values.firstWhere(
          (mode) => mode.toString() == themeModeString,
          orElse: () => ThemeMode.system,
        );
      }
    } catch (e) {
      // If loading fails, keep default system theme
      debugPrint('Failed to load theme preference: $e');
    }
  }

  /// Set theme mode and persist to SharedPreferences
  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_themeModeKey, mode.toString());
    } catch (e) {
      debugPrint('Failed to save theme preference: $e');
    }
  }

  /// Toggle between light and dark themes
  Future<void> toggleTheme() async {
    final newMode = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await setThemeMode(newMode);
  }

  /// Check if current theme is dark
  bool get isDarkMode => state == ThemeMode.dark;

  /// Check if current theme is light
  bool get isLightMode => state == ThemeMode.light;

  /// Check if current theme follows system settings
  bool get isSystemMode => state == ThemeMode.system;
}

/// Helper provider to check if dark mode is active
final isDarkModeProvider = Provider<bool>((ref) {
  final themeMode = ref.watch(themeModeProvider);
  return themeMode == ThemeMode.dark;
});
