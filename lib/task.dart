import 'dart:math';
import 'package:flutter/material.dart';
import "difficulty.dart";


class Task extends StatefulWidget {
  final String titulo;
  final String foto;
  final int dificuldade;

  const Task(this.titulo, this.foto, this.dificuldade, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  int _randomColor = Random().nextInt(Colors.primaries.length);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            // parte azul, "separador"
            decoration: BoxDecoration(
              color: Colors.primaries[_randomColor],
              borderRadius: BorderRadius.circular(7),
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                // parte branca, principal
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                height: 100,
                child: Row(
                  /// Linha para todas as informações da Task
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // exemplo de foto
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.black12,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          widget.foto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(widget.titulo,
                              style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                              )),
                        ),
                        Difficulty(difficultyLevel: widget.dificuldade),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Tooltip(
                          message: "Aumentar nível",
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                nivel++;
                                print((nivel/widget.dificuldade)/10);
                                if((nivel/widget.dificuldade)/10>= 1){
                                  _randomColor = Random().nextInt(Colors.primaries.length);
                                  nivel = 0;
                                }
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Icon(Icons.arrow_drop_up),
                                Text("Up"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ], // Container exemplo de foto Children
                ),
              ),
              Padding(
                /// Lógica da Dificuldade
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 250,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade > 0)
                              ? (nivel / widget.dificuldade) / 10
                              : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Nivel: $nivel",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),          ///Container Principal de Tarefas
        ],
      ),
    );
  }
}