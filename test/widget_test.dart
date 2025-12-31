import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nun_2015_graduation/app.dart';

void main() {
  testWidgets('App builds and shows splash screen', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(
      const ProviderScope(
        child: NunGraduationApp(),
      ),
    );

    // Verify that the splash screen loads
    expect(find.text('NUN 2015 Graduation'), findsOneWidget);
    expect(find.text('Loading...'), findsOneWidget);
  });
}
