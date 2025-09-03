import 'package:flutter/material.dart';

class AdicionarTaskScreen extends StatelessWidget {
  const AdicionarTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicionar tarefa")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Digite o titulo da tarefa",
                label: Text("Título"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: TextField(
              maxLines: 2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Digite uma descrição",
                label: Text("Descrição"),
              
                
              ),
            ),
          ),
          ElevatedButton(onPressed: null, child: Text("Salvar")),
        ],
      ),
    );
  }
}
