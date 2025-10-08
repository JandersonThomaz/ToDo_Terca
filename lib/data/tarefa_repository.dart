import 'package:sqflite/sql.dart';
import 'package:todo_terca/data/db_helper.dart';
import 'package:todo_terca/models/tarefa.dart';

class TarefaRepository {
  Future<void> salvar(Tarefa tarefa) async {
    final db = await getDatabase();

    await db.insert(
      "tarefas",
      tarefa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Tarefa>> listar() async {
    List<Tarefa> tarefas = [];
    final db = await getDatabase();

    final List<Map<String, Object?>> tarefasMaps = await db.query('tarefas');

    for (Map tarefaMap in tarefasMaps) {
      Tarefa tarefa = Tarefa(
        tarefaMap["id"],
        tarefaMap["titulo"],
        tarefaMap["descricao"],
      );

      if(tarefaMap["finalizada"] == 1){
        tarefa.finalizar();
      }
      else{
        tarefa.iniciar();
      }

      tarefas.add(tarefa);
    }

    return tarefas;
  }
}
