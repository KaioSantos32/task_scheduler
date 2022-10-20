import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../components/task.dart';
import '../data/database.dart';

class TaskDao {
  static String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT,'
      '$_difficulty INTEGER ,'
      '$_difficultyLevel INTEGER,'
      '$_image TEXT)';

  static const String _tablename = "taskTabletest";
  static const String _name = "name";
  static const String _difficulty = "difficulty";
  static const String _difficultyLevel = "difficultyLevel";
  static const String _image = "image";

  // MAIN FUNTIONS

  save(Task tarefa) async {
    debugPrint("Entrando função SAVE");

    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tarefa.nome);

    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      debugPrint("Tarefa não existia");
      return await bancoDeDados.insert(_tablename, taskMap);
    } else {
      debugPrint("A Tarefa já existia, atualizando a tarefa");
      print(taskMap);
      return await bancoDeDados.update(_tablename, taskMap,
          where: "$_name = ?", whereArgs: [tarefa.nome]);
    }
  }

  Future<List<Task>> findAll() async {
    debugPrint("Entrando função FINDALL");
    //abre o banco de dados:
    final Database bancoDeDados = await getDatabase();
    // realiza a busca de toda a table:
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    debugPrint("Tabela encontrada: $result");
    // retorna uma lista de Tasks

    print(toList(result));
    return toList(result);
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    debugPrint("Entrando função FIND");

    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
    debugPrint("Tarefa encontrada ${toList(result)}");
    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    debugPrint("Entrando função DELETE");

    final Database bancoDeDados = await getDatabase();

    return bancoDeDados.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
  }

  // SUPPORT FUNCTIONS

  List<Task> toList(List<Map<String, dynamic>> listaDeTarefas){
    debugPrint("Convertendo toList...");
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in listaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    debugPrint("lISTA DE TAREFAS: $tarefas");
    return tarefas;
  }

  Map<String, dynamic> toMap(Task tarefa) {
    debugPrint("Convertendo tarefa em Map");
    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_difficultyLevel] = tarefa.nivel;
    mapaDeTarefas[_image] = tarefa.foto;

    return mapaDeTarefas;
  }

}
