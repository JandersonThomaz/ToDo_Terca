import 'package:flutter/material.dart';
import 'package:todo_terca/data/tarefa_repository.dart';
import 'package:todo_terca/models/tarefa.dart';
import 'package:todo_terca/screens/adicionar_task_screen.dart';
import 'package:todo_terca/services/tarefa_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(child: Text("A")),
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Olá,", style: TextStyle(fontSize: 16.0)),
            Text("Janderson", style: TextStyle(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
      body: FutureBuilder(
        future: TarefaRepository().listar(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasError) {
            return Center(child: Text("opa... deu erro!"));
          }

          if (!asyncSnapshot.hasData) {
            return Center(child: Text("opa... sem tarefas!"));
          }
          var tarefas = asyncSnapshot.data!;

          return Column(
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
                      leading: Checkbox(
                        value: tarefas[index].finalizada,
                        onChanged: (valor) {
                          setState(() {
                            if (valor == true) {
                              tarefas[index].finalizar();
                            } else {
                              tarefas[index].iniciar();
                            }
                          });
                        },
                      ),
                      title: Text(tarefas[index].titulo),
                      subtitle: Text(tarefas[index].descricao),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdicionarTaskScreen()),
          ).then((valor) {
            setState(() {});
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Tarefa criada com sucesso!")),
            );
          });
        },

        child: Icon(Icons.add),
      ),
    );
  }
}
