import 'package:flutter/material.dart';

class Recipe03 extends StatelessWidget {
  const Recipe03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: const DataBodyWidget(objects: [
        "La Fin Du Monde - Bock - 65 ibu",
        "Sapporo Premiume - Sour Ale - 54 ibu",
        "Duvel - Pilsner - 82 ibu"
      ]),
      bottomNavigationBar: const NewNavBar(icons: [
        Icons.coffee_outlined,
        Icons.local_drink_outlined,
        Icons.flag_outlined
      ]),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Dicas"),
      actions: [
        PopupMenuButton<String>(
          onSelected: (String value) {
            print("Selecionou a cor: $value");
            // Aqui poderia haver uma mudança de tema
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class NewNavBar extends StatelessWidget {
  final List<IconData> icons;

  const NewNavBar({super.key, this.icons = const []});

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
  final List<String> objects;

  const DataBodyWidget({super.key, this.objects = const []});

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
