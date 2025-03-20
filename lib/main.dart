import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    home: Scaffold(
      appBar: AppBar(title: Text("Meu app")),
      body: Text("Apenas começando..."),
      bottomNavigationBar: Text("Botão 1"),
    )
  );
  runApp(app);
}