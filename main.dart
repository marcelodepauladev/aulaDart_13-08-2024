import 'package:flutter/material.dart';
import 'pagina3.dart';
import 'pagina1.dart';
import 'pagina2.dart';
import 'pagina4.dart';

void main() {
  runApp(const MaterialApp(title: "Flutter", home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int paginaAtual = 0;
  final List paginas = [const Pagina1(), Pagina2(), Pagina3(), Pagina4()];

  atualizaPagina(int value) {
    setState(() => paginaAtual = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Importados LTDA')),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                  accountName: Text("teste@gmail.com"),
                  accountEmail: Text("Teste"),
                  currentAccountPicture: CircleAvatar(child: Text("TzT"))),
              ListTile(
                  leading: const Icon(Icons.android),
                  title: const Text('Android'),
                  onTap: () {
                    Navigator.pop(context);
                    atualizaPagina(0);
                  }),
              ListTile(
                  leading: const Icon(Icons.apple),
                  title: const Text('Apple'),
                  onTap: () {
                    Navigator.pop(context);
                    atualizaPagina(1);
                  }),
              ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: const Text('Meu carrinho'),
                  onTap: () {
                    Navigator.pop(context);
                    atualizaPagina(2);
                  }),
              ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text('Favoritos'),
                  onTap: () {
                    Navigator.pop(context);
                    atualizaPagina(3);
                  }),
            ],
          ),
        ),
        body: paginas[paginaAtual]);
  }
}
