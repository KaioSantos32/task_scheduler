import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_scheduler/data/task_inherited.dart';
import 'package:task_scheduler/screens/initial_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task scheduler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        secondaryHeaderColor: Colors.blueGrey,
      ),

      home: TaskInherited(child: const InitialScreen()),
    );
  }
}







