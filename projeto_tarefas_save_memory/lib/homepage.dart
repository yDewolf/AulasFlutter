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
    return ListView(
      children: [
        Tarefa(
          "https://www.fractalcamo.com/uploads/5/9/0/2/5902948/s281242620377187514_p1557_i1_w750.jpeg",
          "Minecraft",
          "Minecraft.",
        ),
        Tarefa(
          "https://m.media-amazon.com/images/M/MV5BZGEwZDBjODAtMGFjOS00OTZmLTg2OGItZDYyMTE3MjFmOGMyXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg",
          "Noita",
          "Passar do último boss",
        ),
        Tarefa(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuufLLyoTDk1fbRSODHcnzfbj5bmSm0b56nQ&s",
          "Malphite whatsapp",
          "Lembrar de abrir baú pra conseguir a skin",
        ),
        Tarefa(
          "https://ddragon.leagueoflegends.com/cdn/img/champion/tiles/Singed_0.jpg",
          "Singed",
          "Mind control",
        ),
      ],
    );
  }
}

class Tarefa extends StatelessWidget {
  final String image_link;
  final String name;
  final String description;
  const Tarefa(this.image_link, this.name, this.description, {super.key});

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
                    Expanded(
                      child: SizedBox(
                        width: 120,
                        height: 80,
                        child: Row(
                          spacing: 10,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              color: const Color.fromARGB(255, 255, 0, 242),
                              child: Image.network(image_link),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(name, style: TextStyle(fontSize: 20)),
                                Text(description),
                              ],
                            ),
                          ],
                        ),
                      ),
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
