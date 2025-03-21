import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    home: Scaffold(
      appBar: AppBar(title: Text("Meu app")),
      body: Center(
        child: Column(
          children: [
            Text(
              "Apenas começando...",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                 fontSize: 18
                ),
              ),
            Text(
              "No meio...",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                 fontSize: 18
                ),
              ),
            Text(
              "Terminando...",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                 fontSize: 18
                ),
              ) 
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("Botão 1"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Botão 2"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Botão 3"),
            )
          ],
        ),
      )
    )
  );
  runApp(app);
}