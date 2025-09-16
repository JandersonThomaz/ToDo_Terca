import 'package:flutter/material.dart';

class AdicionarTaskScreen extends StatelessWidget {
  AdicionarTaskScreen({super.key});

  final tituloController = TextEditingController();
  final descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicionar tarefa")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Digite o titulo da tarefa",
                label: Text("Título"),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              controller: tituloController,
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: TextFormField(
              maxLines: 2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Digite uma descrição",
                label: Text("Descrição"),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              controller: descricaoController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FilledButton(
              onPressed: (){},
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: Center(child: Text("Salvar")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
