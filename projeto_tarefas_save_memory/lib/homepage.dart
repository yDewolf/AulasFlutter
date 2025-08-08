import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas !"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Tarefas(),
    );
  }
}

class Tarefas extends StatelessWidget {
  const Tarefas({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Tarefa(), Tarefa()]);
  }
}

class Tarefa extends StatelessWidget {
  const Tarefa({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 175, 190, 190),
            height: 116,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        Container(width: 80, height: 80, color: Colors.blue),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nome da lista provavelmente",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text("Descrição da lista ou algo do tipo"),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => {print("OIIII")},
                          child: Icon(Icons.edit),
                        ),
                        ElevatedButton(
                          onPressed: () => {print("VocÊ vai ser deletado!!")},
                          child: Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
