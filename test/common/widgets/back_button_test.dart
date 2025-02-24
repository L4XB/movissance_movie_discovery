import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:red_line/src/common/widgets/back_button.dart';

void main() {
  group('CustomBackButton', () {
    testWidgets('should pop the navigator when tapped',
        (WidgetTester tester) async {
      bool didPop = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Navigator(
              onDidRemovePage: (page) {
                didPop = true;
              },
              pages: [
                MaterialPage(child: Scaffold(body: CustomBackButton())),
              ],
            ),
          ),
        ),
      );

      expect(didPop, isFalse);

      await tester.tap(find.byType(CustomBackButton));
      await tester.pumpAndSettle();

      expect(didPop, isTrue);
    });
  });
}
