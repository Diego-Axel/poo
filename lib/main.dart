import 'package:flutter/material.dart';


var dataObjects = [
  {
    "name": "La Fin Du Monde",
    "style": "Bock",
    "ibu": "65"
  },
  {
    "name": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"
  },
  {
    "name": "Duvel",
    "style": "Pilsner",
    "ibu": "82"
  },
  {
    "name": "Heineken",
    "style": "Lager",
    "ibu": "23"
  },
  {
    "name": "Guinness",
    "style": "Stout",
    "ibu": "45"
  },
  {
    "name": "Budweiser",
    "style": "Lager",
    "ibu": "15"
  },
  {
    "name": "Corona",
    "style": "Pale Lager",
    "ibu": "20"
  },
  {
    "name": "Stella Artois",
    "style": "Pilsner",
    "ibu": "30"
  },
  {
    "name": "Skol",
    "style": "Pilsen",
    "ibu": "18"
  },
  {
    "name": "Brahma",
    "style": "Lager",
    "ibu": "16"
  }
];


void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: Text('Lista de Cervejas')),
      body: MytileWidget(data: dataObjects),
    ),
  ));
}


class MytileWidget extends StatelessWidget {
  final List<Map<String, String>> data;

  MytileWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        var item = data[index];
        return ListTile(
          leading: Icon(Icons.local_drink_outlined),
          title: Text(item["name"] ?? "Sem nome"),
          subtitle: Text("Estilo: ${item["style"]} | IBU: ${item["ibu"]}"),
        );
      },
    );
  }
}