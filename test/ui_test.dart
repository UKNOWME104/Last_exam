
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:last_exam/main.dart'; // Add this package to your project
// Replace with the actual file containing your app

void main() {
  testGoldens('UI Screenshot Test', (WidgetTester tester) async {
    // Define the widget to test
    final widgetUnderTest = MyApp(); // Replace with your main widget or specific UI widget

    // Load the widget
    await tester.pumpWidgetBuilder(widgetUnderTest);

    // Capture the golden file
    await screenMatchesGolden(tester, 'ui_sc');
  });
}