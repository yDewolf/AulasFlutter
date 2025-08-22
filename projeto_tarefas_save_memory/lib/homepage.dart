import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showForm(BuildContext context) {
    final  TextEditingController imageController = TextEditingController();
    final  TextEditingController descricaoController = TextEditingController();

    showDialog(context: context, 
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Cadastrar atividade", 
                          style: TextStyle(fontSize: 20, fontFamily: "Verdana", fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () => {
                            Navigator.of(context).pop()
                          }, 
                          icon: Icon(Icons.close)
                        )
                      ],
                    ),
                    TextField(
                      controller: imageController,
                      decoration: InputDecoration(
                        labelText: "URL da Imagem da Tarefa"
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    TextField(
                      controller: descricaoController,
                      decoration: InputDecoration(
                        labelText: "Descrição da Tarefa"
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {}, 
                          child: Text("Cancelar")
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          }, 
                          child: Text("Salvar")
                        ),
                      ],
                    )
                  ],
              ),
            ),
          )
        );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas !"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Tarefas(),
      floatingActionButton: FloatingActionButton(onPressed: () => {
        _showForm(context)
      }, child: Icon(Icons.add),),
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
  String image_link;
  String name;
  String description;

  Tarefa(this.image_link, this.name, this.description, {super.key});

  void _showEditForm(BuildContext context) {
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController imageController = TextEditingController();
    final TextEditingController descricaoController = TextEditingController();

    showDialog(context: context, 
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Editar Tarefa", 
                          style: TextStyle(fontSize: 20, fontFamily: "Verdana", fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () => {
                            Navigator.of(context).pop()
                          }, 
                          icon: Icon(Icons.close)
                        )
                      ],
                    ),
                    TextField(
                      controller: nomeController,
                      decoration: InputDecoration(
                        labelText: "Nome da Tarefa"
                      ),
                    ),
                    TextField(
                      controller: imageController,
                      decoration: InputDecoration(
                        labelText: "URL da Imagem da Tarefa"
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    TextField(
                      controller: descricaoController,
                      decoration: InputDecoration(
                        labelText: "Descrição da Tarefa"
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {}, 
                          child: Text("Cancelar")
                        ),
                        ElevatedButton(
                          onPressed: () {
                            image_link = imageController.text;
                            description = descricaoController.text;
                            name = nomeController.text;

                            Navigator.of(context).pop();
                          }, 
                          child: Text("Salvar")
                        ),
                      ],
                    )
                  ],
              ),
            ),
          )
        );
    });
  }

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
                          onPressed: () => {_showEditForm(context)},
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
