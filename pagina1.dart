import 'package:flutter/material.dart';
import 'android.dart';
import 'carrinho.dart';
import 'favoritos.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<Pagina1> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina1> {
  @override
  Widget build(BuildContext context) {
    pesquisa();
    return Scaffold(
      appBar: AppBar(title: const Text('Android')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            caixaPesquisa(),
            Expanded(child: grade()),
            txtTotal(),
          ],
        ),
      ),
    );
  }

  TextEditingController txtPesquisa = TextEditingController();
  List<Android> consulta = [];

  caixaPesquisa() {
    return TextField(
      controller: txtPesquisa,
      onChanged: (v) => pesquisa(),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.search),
      ),
    );
  }

  txtTotal() {
    return Text(
      'Total do Pedido: R\$ ${total.toStringAsFixed(2)}',
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  pesquisa() {
    final pesquisaTexto = txtPesquisa.text.toLowerCase();

    if (pesquisaTexto.isEmpty) {
      consulta = androids;
    } else {
      consulta = androids.where((p) {
        final descricaoMatch =
            p.descricao.toLowerCase().contains(pesquisaTexto);
        final valorMatch = p.valor.toStringAsFixed(2).contains(pesquisaTexto);
        return descricaoMatch || valorMatch;
      }).toList();
    }

    setState(() {});
  }

  grade() {
    return GridView.builder(
      itemCount: consulta.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemBuilder: (BuildContext context, int index) {
        final android = consulta[index];
        return Card(
          child: Center(
            child: Column(
              children: [
                Expanded(child: Image.network(android.foto)),
                Text(android.descricao),
                Text("R\$ ${android.valor.toStringAsFixed(2)}"),
                ElevatedButton.icon(
                  onPressed: () => caixaMensagem(index, context),
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text("Comprar"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  caixaMensagem(int i, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(consulta[i].descricao),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(consulta[i].foto),
              Text(
                "R\$ ${consulta[i].valor.toStringAsFixed(2)}",
                style: const TextStyle(color: Colors.red, fontSize: 20),
              ),
              caixaQtde(),
            ],
          ),
        ),
        actions: [botao(i, context)],
      ),
    );
  }

  TextEditingController txtQtde = TextEditingController();

  caixaQtde() {
    return TextField(
      controller: txtQtde,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: "Quantidade"),
    );
  }

  botao(int i, BuildContext context) {
  return Row(
    children: [
      ElevatedButton(
        onPressed: () {
          final int qtde = int.tryParse(txtQtde.text) ?? 0;
          setState(() {
            total += consulta[i].valor * qtde;
            txtQtde.clear();
            Navigator.pop(context);
          });
        },
        child: const Text("Comprar"),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            final dispositivoAtual = consulta[i];
            favoritos.add(Dispositivo(
              descricao: dispositivoAtual.descricao,
              valor: dispositivoAtual.valor,
              foto: dispositivoAtual.foto,
            ));
          });
        },
        child: const Icon(Icons.favorite),
      ),
    ],
  );
}

}
