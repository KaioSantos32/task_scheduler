import 'package:flutter/material.dart';
import 'package:flutter_3_ponto_0/task.dart';

class addTask extends StatelessWidget {
  addTask({Key? key}) : super(key: key);

  List<Task> items = [
    Task('Aprender Flutter',
        'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 3),
    Task(
        'Andar de Bike',
        'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg',
        2),
    Task(
        'Meditar',
        'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
        5),
    Task(
        'Ler',
        'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
        3),
    Task('Jogar', 'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg', 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionando Nova Task"),
      ),
      body: Stack(
        children: [
          Container(
            /// Background color
            decoration: BoxDecoration(
              color: Colors.teal.shade100,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, top: 40.0, bottom: 50.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                    ),
                    height: 90,
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 18, right: 18, top: 18, bottom: 18),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Atividade',
                          filled: true,
                          fillColor: Colors.white54,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                    ),
                    height: 100,
                    child: const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Dificuldade',
                          filled: true,
                          fillColor: Colors.white54,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {Navigator.pop(context);},

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "Adicionar",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
