import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:task_scheduler/data/task_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'taskDesafio.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TaskDao.tableSql);
    },
    version: 2,
  );
}
