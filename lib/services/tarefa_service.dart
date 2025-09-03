import 'package:todo_terca/models/tarefa.dart';

class TarefaService {
  List<Tarefa> listarTodas(){
    
    List<Tarefa> tarefas = [
      Tarefa(1, "Limpar a casa", "Para ela"),
      Tarefa(2, "Estudar Flutter", "Para eu"),
      Tarefa(3, "Lavar a louça", "Para ter"),
      Tarefa(4, "Lavar a área", "Para ela ")
    ];

    return tarefas;

  }
}