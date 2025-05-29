import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TableConfig {
  final List<Map<String, String>> data;
  final List<String> columnNames;
  final List<String> propertyNames;

  TableConfig({
    required this.data,
    required this.columnNames,
    required this.propertyNames,
  });
}

class DataService {
  final ValueNotifier<TableConfig> tableStateNotifier = ValueNotifier(
    TableConfig(
      data: [],
      columnNames: ["Nome", "Estilo", "IBU"],
      propertyNames: ["name", "style", "ibu"],
    ),
  );

  final Map<int, Function> carregadores = {};

  DataService() {
    carregadores[0] = carregarCafes;
    carregadores[1] = carregarCervejas;
    carregadores[2] = carregarNacoes;
  }

  void carregar(index) {
    carregadores[index]?.call();
  }

  void carregarCervejas() {
    tableStateNotifier.value = TableConfig(
      data: [
        {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
        {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
        {"name": "Duvel", "style": "Pilsner", "ibu": "82"}
      ],
      columnNames: ["Nome", "Estilo", "IBU"],
      propertyNames: ["name", "style", "ibu"],
    );
  }

  void carregarCafes() {
    tableStateNotifier.value = TableConfig(
      data: [
        {"name": "Café do Cerrado", "region": "Minas Gerais", "rating": "4.5"},
        {"name": "Blue Mountain", "region": "Jamaica", "rating": "4.8"},
        {"name": "Kopi Luwak", "region": "Indonésia", "rating": "4.2"}
      ],
      columnNames: ["Nome", "Região", "Avaliação"],
      propertyNames: ["name", "region", "rating"],
    );
  }

  void carregarNacoes() {
    tableStateNotifier.value = TableConfig(
      data: [
        {"name": "Brasil", "capital": "Brasília", "population": "210M"},
        {"name": "Japão", "capital": "Tóquio", "population": "125M"},
        {"name": "Canadá", "capital": "Ottawa", "population": "38M"}
      ],
      columnNames: ["Nome", "Capital", "População"],
      propertyNames: ["name", "capital", "population"],
    );
  }
}

final dataService = DataService();

void main() {
  runApp(MyApp());
}

class NewNavBar extends HookWidget {
  final Function(int)? itemSelectedCallback;

  NewNavBar({this.itemSelectedCallback});

  @override
  Widget build(BuildContext context) {
    var state = useState(1);

    return BottomNavigationBar(
      onTap: (index) {
        state.value = index;
        itemSelectedCallback?.call(index);
      },
      currentIndex: state.value,
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dicas"),
        ),
        body: ValueListenableBuilder<TableConfig>(
          valueListenable: dataService.tableStateNotifier,
          builder: (_, value, __) {
            return DataTableWidget(
              jsonObjects: value.data,
              columnNames: value.columnNames,
              propertyNames: value.propertyNames,
            );
          },
        ),
        bottomNavigationBar: NewNavBar(itemSelectedCallback: dataService.carregar),
      ),
    );
  }
}

class DataTableWidget extends StatelessWidget {
  final List<Map<String, String>> jsonObjects;
  final List<String> columnNames;
  final List<String> propertyNames;

  const DataTableWidget({
    this.jsonObjects = const [],
    this.columnNames = const ["Nome", "Estilo", "IBU"],
    this.propertyNames = const ["name", "style", "ibu"],
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
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            )
            .toList(),
        rows: jsonObjects
            .map(
              (obj) => DataRow(
                cells: propertyNames
                    .map(
                      (propName) => DataCell(
                        Text(obj[propName] ?? ""),
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(),
      ),
    );
  }
}
