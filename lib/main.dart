import 'package:flutter/material.dart';


var coffeeObjects = [
  {"brand": "Illy", "type": "Espresso", "intensity": "Strong"},
  {"brand": "Nespresso", "type": "Lungo", "intensity": "Medium"},
  {"brand": "Pilão", "type": "Tradicional", "intensity": "Strong"},
  {"brand": "Melitta", "type": "Coador", "intensity": "Mild"},
];


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: Text("Tabela Genérica")),
      body: DataBodyWidget(
        objects: coffeeObjects,
        columnNames: ["Marca", "Tipo", "Intensidade"],
        propertyNames: ["brand", "type", "intensity"],
      ),
    ),
  ));
}


class DataBodyWidget extends StatelessWidget {
  final List<Map<String, dynamic>> objects;
  final List<String> columnNames;
  final List<String> propertyNames;

  DataBodyWidget({
    required this.objects,
    required this.columnNames,
    required this.propertyNames,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: columnNames
            .map((name) => DataColumn(
                    label: Expanded(
                        child: Text(name,
                            style: TextStyle(fontStyle: FontStyle.italic)))))
            .toList(),
        rows: objects.map((obj) {
          return DataRow(
            cells: propertyNames.map((propName) {
              var cellValue = obj[propName]?.toString() ?? "";
              return DataCell(Text(cellValue));
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}