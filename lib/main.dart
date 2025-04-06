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
        appBar: MyAppBar(),
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

// Nova classe para o AppBar
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Dicas"),
      actions: [
        PopupMenuButton<String>(
          onSelected: (String value) {
            print("Selecionou a cor: $value");
            // Trocar tema futuramente
          },
          itemBuilder: (BuildContext context) {
            return const [
              PopupMenuItem<String>(
                value: "Roxo",
                child: Text("Roxo"),
              ),
              PopupMenuItem<String>(
                value: "Verde",
                child: Text("Verde"),
              ),
              PopupMenuItem<String>(
                value: "Laranja",
                child: Text("Laranja"),
              ),
            ];
          },
        ),
      ],
    );
  }

  // Necessário implementar `preferredSize` quando extendemos PreferredSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
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
      label: "",
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