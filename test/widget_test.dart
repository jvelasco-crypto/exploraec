// Prueba mínima de humo: la app arranca y muestra la barra de navegación inferior.
// (El test original de `flutter create` probaba el contador de la plantilla, que ya no existe.)

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:exploraec/main.dart';

void main() {
  testWidgets('ExploraEC arranca con la barra de navegación', (WidgetTester tester) async {
    await tester.pumpWidget(const ExploraEcApp());
    // Deja terminar la carga simulada de lugares (Future.delayed de 1 s).
    await tester.pump(const Duration(seconds: 2));

    expect(find.byType(BottomNavigationBar), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
  });
}
