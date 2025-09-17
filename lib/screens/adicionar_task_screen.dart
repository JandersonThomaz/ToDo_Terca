import 'package:flutter/material.dart';
import 'package:todo_terca/models/tarefa.dart';

class AdicionarTaskScreen extends StatelessWidget {
  AdicionarTaskScreen({super.key});

  final tituloController = TextEditingController();
  final descricaoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicionar tarefa")),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            //Campo do titulo
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
                maxLength: 30,
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return "Preencha o campo título";
                  }
                  if (valor.length < 4) {
                    return "Digite pelo menos 4 caracteres!";
                  }

                  return null;
                },
              ),
            ),

            //Campo da descrição
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
                maxLength: 140,
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return "Preencha o campo descrição";
                  }

                  if (valor.length < 10) {
                    return "Digite pelo menos 10 caracteres!";
                  }

                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FilledButton(
                onPressed: () {
                  //Formulário está valido
                  if (_formKey.currentState!.validate()) {
                    Tarefa novaTarefa = Tarefa(
                      0,
                      tituloController.text,
                      descricaoController.text,
                    );

                    Navigator.pop(context, novaTarefa);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Tarefa criada com sucesso!")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Preencha o formulário corretamente!"),
                      ),
                    );
                  }
                },
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Center(child: Text("Salvar")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
