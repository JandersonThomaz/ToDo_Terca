
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async{

final database = await openDatabase(

    join(await getDatabasesPath(), 'tarefas.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE tarefas(id INTEGER PRIMARY KEY, titulo TEXT, descricao TEXT, finalizada INTEGER)',
      );
    },
    version: 1,
  );

  return database;
}