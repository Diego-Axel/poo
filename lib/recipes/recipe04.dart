import 'package:flutter/material.dart';

class Recipe04 extends StatelessWidget {
  const Recipe04({super.key});

  @override
  Widget build(BuildContext context) {
    var coffeeObjects = [
      {"brand": "Illy", "type": "Espresso", "intensity": "Strong"},
      {"brand": "Nespresso", "type": "Lungo", "intensity": "Medium"},
      {"brand": "Pilão", "type": "Tradicional", "intensity": "Strong"},
      {"brand": "Melitta", "type": "Coador", "intensity": "Mild"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tabela Genérica"),
      ),
      body: DataBodyWidget(
        objects: coffeeObjects,
        columnNames: const ["Marca", "Tipo", "Intensidade"],
        propertyNames: const ["brand", "type", "intensity"],
      ),
    );
  }
}

class DataBodyWidget extends StatelessWidget {
  final List<Map<String, dynamic>> objects;
  final List<String> columnNames;
  final List<String> propertyNames;

  const DataBodyWidget({
    super.key,
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
            .map(
              (name) => DataColumn(
                label: Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            )
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

