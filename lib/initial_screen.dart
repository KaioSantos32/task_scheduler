import 'package:flutter/material.dart';
import 'package:flutter_3_ponto_0/task.dart';
import 'package:flutter_3_ponto_0/add_task_screen.dart';

class initialScreen extends StatefulWidget {
  const initialScreen({Key? key}) : super(key: key);

  @override
  State<initialScreen> createState() => _initialScreenState();
}

class _initialScreenState extends State<initialScreen> {
  bool opacidade = true;
  List<Task> items = const [
    Task('Aprender Flutter',
        'assets/images/Dash.png', 3),
    Task('Andar de Bike',
        'assets/images/bicicleta.jpg',
        1),
    Task('Meditar',
        'assets/images/meditar.jpeg',
        5),
    Task('Ler',
        'assets/images/livro.jpg',
        3),
    Task('Jogar',
        'assets/images/kako_jogando.jpg', 1),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text("Tasks"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                opacidade = !opacidade;
              });
            },
            icon: Icon(Icons.remove_red_eye),
          )
        ],
      ),

      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(seconds: 1),
        child: ListView.builder(
            itemBuilder: (listViewContext, index){
              return Container(
                color: Colors.teal.shade100,
                child: items[index],
              );
            },
            itemCount: items.length,
          ),

      ),

      floatingActionButton: FloatingActionButton(
        tooltip: "Adicionar Task",
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addTask()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
