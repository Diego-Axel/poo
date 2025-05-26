import 'package:flutter/material.dart';

// Funções / Classes

Widget _placeHolderBuild(String imageUrl) {
  return FadeInImage.assetNetwork(
    placeholder: 'assets/ampulheta.gif',
    image: imageUrl,
    width: 150,
    height: 150,
    fadeInDuration: Duration(milliseconds: 500),
  );
}


class CaixaBotoes extends StatelessWidget {
  const CaixaBotoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.liquor, color: Colors.white),
                SizedBox(width: 4),
                Text("Botão 1", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.liquor, color: Colors.white),
                SizedBox(width: 4),
                Text("Botão 2", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.liquor, color: Colors.white),
                SizedBox(width: 4),
                Text("Botão 3", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Recipe01 extends StatelessWidget {
  const Recipe01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Cervejas Bar"),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  _placeHolderBuild(
                    'https://i.postimg.cc/WztMvG06/cerveja-Bar.jpg',
                  ),
                  const SizedBox(height: 10),
                  DataTable(
                    columns: const [
                      DataColumn(label: Text('Nome')),
                      DataColumn(label: Text('Estilo')),
                      DataColumn(label: Text('IBU')),
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(Text('La Fin Du Monde')),
                        DataCell(Text('Bock')),
                        DataCell(Text('65')),
                      ]),
                      // ... demais linhas
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const CaixaBotoes(),
      ),
    );
  }
}