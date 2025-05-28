import 'package:flutter/material.dart';
import 'recipes/recipe01.dart';
import 'recipes/recipe02.dart';
import 'recipes/recipe03.dart';
import 'recipes/recipe04.dart';
import 'recipes/recipe05.dart';
import 'recipes/recipe06.dart';

void main() {
  runApp(const ReceitasApp());
}

class ReceitasApp extends StatelessWidget {
  const ReceitasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas POO UNIDADE 01',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aluno: Diêgo Axel Bernardo Santos Rodrigues'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 1; i <= 6; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => _getRecipePage(i),
                      ),
                    );
                  },
                  child: Text('Receita ${i.toString().padLeft(2, '0')}'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _getRecipePage(int index) {
    switch (index) {
      case 1:
        return const Recipe01();
      case 2:
        return const Recipe02();
      case 3:
        return const Recipe03();
      case 4:
        return const Recipe04();
      case 5:
        return const Recipe05();
      case 6:
        return const Recipe06();
      default:
        return const Scaffold();
    }
  }
}