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
  List<Task> items = [
    Task('Aprender Flutter',
        'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 3),
    Task('Andar de Bike',
        'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg',
        2),
    Task('Meditar',
        'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
        5),
    Task('Ler',
        'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
        3),
    Task('Jogar',
        'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg', 1),
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
          )
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
