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

class CaixaBody extends StatelessWidget {
  const CaixaBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
                  DataRow(cells: [
                    DataCell(Text('Sapporo Premium')),
                    DataCell(Text('Sour Ale')),
                    DataCell(Text('54')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Duvel')),
                    DataCell(Text('Pilsner')),
                    DataCell(Text('82')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Chimay Blue')),
                    DataCell(Text('Belgian Strong Dark Ale')),
                    DataCell(Text('35')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Westvleteren 12')),
                    DataCell(Text('Quadrupel')),
                    DataCell(Text('10')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Heineken')),
                    DataCell(Text('Pilsner')),
                    DataCell(Text('19')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Guinness')),
                    DataCell(Text('Stout')),
                    DataCell(Text('45')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Corona Extra')),
                    DataCell(Text('Pale Lager')),
                    DataCell(Text('19')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Amstel')),
                    DataCell(Text('Pilsner')),
                    DataCell(Text('18')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Miller Lite')),
                    DataCell(Text('Light Lager')),
                    DataCell(Text('10')),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CaixaBotoes extends StatelessWidget {
  const CaixaBotoes({Key? key}) : super(key: key);

  void botaoFoiTocado(int index) {
    print("Tocaram no item da barra de navegação \$index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: botaoFoiTocado,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.green),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, color: Colors.green),
          label: 'Buscar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.green),
          label: 'Perfil',
        ),
      ],
    );
  }
}

class CaixaAppBar extends AppBar {
  CaixaAppBar()
      : super(
          title: const Text('Cervejas Bar'),
          backgroundColor: Colors.green,
        );
}

class Recipe02 extends StatelessWidget {
  const Recipe02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        appBar: CaixaAppBar(),
        body: const CaixaBody(),
        bottomNavigationBar: const CaixaBotoes(),
      ),
    );
  }
}

void main() {
  runApp(const Recipe02());
}