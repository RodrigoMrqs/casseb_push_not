import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:casseb_push_not/screens/home_screen.dart';

void main() {
  testWidgets('Home lista os eventos', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    expect(find.text('Semana de Tecnologia'), findsOneWidget);
  });
}
