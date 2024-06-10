import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playground/presentation/pages/login/login_page.dart';

void main() {
  testWidgets('LoginPage', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        title: 'Flutter Demo',
        home: LoginPage(),
      ),
    );
  });
}
