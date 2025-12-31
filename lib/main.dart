import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

/// Entry point for NUN 2015 Graduation Memorial App
void main() {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Run app with Riverpod provider scope
  runApp(
    const ProviderScope(
      child: NunGraduationApp(),
    ),
  );
}
