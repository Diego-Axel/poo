import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();
  runApp(app);
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
        body: DataBodyWidget(objects: [
          "La Fin Du Monde - Bock - 65 ibu",
          "Sapporo Premiume - Sour Ale - 54 ibu",
          "Duvel - Pilsner - 82 ibu"
        ]),
        bottomNavigationBar: NewNavBar(icons: const [
          Icons.coffee_outlined,
          Icons.local_drink_outlined,
          Icons.flag_outlined
        ]),
      ),
    );
  }
}

class NewNavBar extends StatelessWidget {
  final List<IconData> icons;

  NewNavBar({this.icons = const []});

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  BottomNavigationBarItem construirItem(IconData icone) {
    return BottomNavigationBarItem(
      icon: Icon(icone),
      label: "", // por enquanto, sem label conforme solicitado
    );
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items =
        icons.map((icone) => construirItem(icone)).toList();

    return BottomNavigationBar(
      onTap: botaoFoiTocado,
      items: items,
    );
  }
}

class DataBodyWidget extends StatelessWidget {
  List<String> objects;

  DataBodyWidget({this.objects = const []});

  Expanded processarUmElemento(String obj) {
    return Expanded(
      child: Center(child: Text(obj)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Expanded> allTheLines =
        objects.map((obj) => processarUmElemento(obj)).toList();
    return Column(children: allTheLines);
  }
}