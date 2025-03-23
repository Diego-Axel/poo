import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.purple,
      fontFamily: 'Roboto', // Define a fonte padrão do app
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
            SizedBox(height: 10), // Espaço entre os elementos
            _buildImageWithPlaceholder('https://i.postimg.cc/9f6CqQxW/paia.jpg'),
            Text(
              "No meio...",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                 fontSize: 18
                 ),
            ),
            SizedBox(height: 10), // Espaço entre os elementos
            _buildImageWithPlaceholder('https://i.postimg.cc/nLwHk10G/Captura-de-tela-2024-10-25-141130.png'),
            Text(
              "Terminando...",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                 fontSize: 18
                 ),
            ),
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
              child: Icon(Icons.phone),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star),
                  SizedBox(width: 5),
                  Text("Botão 2"),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.phone_android),
            ),
          ],
        ),
      ),
    ),
  );
  runApp(app);
}

Widget _buildImageWithPlaceholder(String imageUrl) {
  return FadeInImage.assetNetwork(
    placeholder: 'assets/loading.png', // Precisa de um asset local de loading
    image: imageUrl,
    width: 150,
    height: 150,
    fit: BoxFit.cover,
    fadeInDuration: Duration(milliseconds: 500),
  );
}