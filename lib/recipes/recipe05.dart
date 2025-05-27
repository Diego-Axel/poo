import 'package:flutter/material.dart';

class Recipe05 extends StatelessWidget {
  const Recipe05({super.key});

  @override
  Widget build(BuildContext context) {
    var dataObjects = [
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premium", "style": "Sour Ale", "ibu": "54"},
      {"name": "Duvel", "style": "Pilsner", "ibu": "82"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dicas"),
      ),
      body: DataTableWidget(jsonObjects: dataObjects),
      bottomNavigationBar: const NewNavBar2(),
    );
  }
}

class NewNavBar2 extends StatefulWidget {
  const NewNavBar2({super.key});

  @override
  State<NewNavBar2> createState() => _NewNavBar2State();
}

class _NewNavBar2State extends State<NewNavBar2> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      currentIndex: selectedIndex,
      items: const [
        BottomNavigationBarItem(
          label: "Cafés",
          icon: Icon(Icons.coffee_outlined),
        ),
        BottomNavigationBarItem(
          label: "Cervejas",
          icon: Icon(Icons.local_drink_outlined),
        ),
        BottomNavigationBarItem(
          label: "Nações",
          icon: Icon(Icons.flag_outlined),
        ),
      ],
    );
  }
}

class DataTableWidget extends StatelessWidget {
  final List<Map<String, String>> jsonObjects;

  const DataTableWidget({super.key, this.jsonObjects = const []});

  @override
  Widget build(BuildContext context) {
    var columnNames = ["Nome", "Estilo", "IBU"];
    var propertyNames = ["name", "style", "ibu"];

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
        rows: jsonObjects
            .map(
              (obj) => DataRow(
                cells: propertyNames
                    .map((propName) => DataCell(Text(obj[propName] ?? "")))
                    .toList(),
              ),
            )
            .toList(),
      ),
    );
  }
}
