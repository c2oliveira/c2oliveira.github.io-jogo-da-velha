import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart'; // Substitua 'your_app' pelo nome do seu app

void main() {
  testWidgets('Teste inicial do layout do Jogo da Velha', (WidgetTester tester) async {
    // Inicializa o aplicativo
    await tester.pumpWidget(const TicTacToeApp());

    // Verifica se o título está na tela
    expect(find.text('Jogo da Velha'), findsOneWidget);

    // Verifica se o texto inicial exibe o turno do jogador X
    expect(find.textContaining('Turno do Jogador X'), findsOneWidget);

    // Verifica se há exatamente 9 células
    expect(find.byType(GestureDetector), findsNWidgets(9));
  });

  testWidgets('Teste de jogada básica', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());

    // Simula o jogador X clicando na célula 0
    final firstCell = find.byType(GestureDetector).at(0);
    await tester.tap(firstCell);
    await tester.pump();

    // Verifica se o X apareceu na célula 0
    expect(find.text('X'), findsOneWidget);

    // Simula o jogador O clicando na célula 1
    final secondCell = find.byType(GestureDetector).at(1);
    await tester.tap(secondCell);
    await tester.pump();

    // Verifica se o O apareceu na célula 1
    expect(find.text('O'), findsOneWidget);
  });

  testWidgets('Teste de vitória do jogador X', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());

    // Simula o jogador X fazendo uma linha horizontal
    await tester.tap(find.byType(GestureDetector).at(0));
    await tester.pump();

    await tester.tap(find.byType(GestureDetector).at(3));
    await tester.pump();

    await tester.tap(find.byType(GestureDetector).at(1));
    await tester.pump();

    await tester.tap(find.byType(GestureDetector).at(4));
    await tester.pump();

    await tester.tap(find.byType(GestureDetector).at(2));
    await tester.pump();

    // Verifica se o jogador X venceu
    expect(find.textContaining('Jogador X venceu!'), findsOneWidget);
  });

  testWidgets('Teste do botão de reinício', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());

    // Simula o jogador X clicando na célula 0
    final firstCell = find.byType(GestureDetector).at(0);
    await tester.tap(firstCell);
    await tester.pump();

    // Verifica se o X apareceu na célula 0
    expect(find.text('X'), findsOneWidget);

    // Simula o clique no botão de reinício
    final resetButton = find.text('Reiniciar Jogo');
    await tester.tap(resetButton);
    await tester.pump();

    // Verifica se o tabuleiro está vazio novamente
    expect(find.text('X'), findsNothing);
    expect(find.textContaining('Turno do Jogador X'), findsOneWidget);
  });
}
