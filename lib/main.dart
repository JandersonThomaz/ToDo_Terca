import 'package:flutter/material.dart';
import 'package:todo_terca/models/tarefa.dart';
import 'package:todo_terca/services/tarefa_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Tarefa> tarefas = TarefaService().listarTodas();

    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          toolbarHeight: 100,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Olá,", style: TextStyle(fontSize: 16.0)),
              Text("Janderson", style: TextStyle()),
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            Text(
              "Todas as tarefas",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    leading: Text(tarefas[index].id.toString()),
                    title: Text(tarefas[index].titulo),
                    subtitle: Text(tarefas[index].descricao),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
