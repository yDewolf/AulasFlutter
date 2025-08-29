import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> _tarefas = [];
  void _adicionarTarefas(
    BuildContext context,
    String url,
    String name,
    String description,
  ) {
    // Metodos set
    setState(() {
      _tarefas.add({"url": url, "name": name, "description": description});
    });
  }

  void _showFormEdit(BuildContext context) {
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController imageController = TextEditingController();
    final TextEditingController descricaoController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
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
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Verdana",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => {Navigator.of(context).pop()},
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),
                  TextField(
                    controller: nomeController,
                    decoration: InputDecoration(labelText: "Nome da Tarefa"),
                  ),
                  TextField(
                    controller: imageController,
                    decoration: InputDecoration(
                      labelText: "URL da Imagem da Tarefa",
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: descricaoController,
                    decoration: InputDecoration(
                      labelText: "Descrição da Tarefa",
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text("Cancelar")),
                      ElevatedButton(
                        onPressed: () {
                          // image_link = imageController.text;
                          // description = descricaoController.text;
                          // name = nomeController.text;

                          Navigator.of(context).pop();
                        },
                        child: Text("Salvar"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showForm(BuildContext context) {
    final TextEditingController imageController = TextEditingController();
    final TextEditingController descricaoController = TextEditingController();
    final TextEditingController nomeController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
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
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Verdana",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => {Navigator.of(context).pop()},
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),
                  TextField(
                    controller: nomeController,
                    decoration: InputDecoration(labelText: "Nome da Tarefa"),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: imageController,
                    decoration: InputDecoration(
                      labelText: "URL da Imagem da Tarefa",
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: descricaoController,
                    decoration: InputDecoration(
                      labelText: "Descrição da Tarefa",
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text("Cancelar")),
                      ElevatedButton(
                        onPressed: () {
                          _adicionarTarefas(
                            context,
                            imageController.text,
                            nomeController.text,
                            descricaoController.text,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Tarefa cadastrada com sucesso !"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          Navigator.of(context).pop();
                        },
                        child: Text("Salvar"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas !"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: _tarefas.length,
        itemBuilder: (context, index) {
          return Tarefa(
            _tarefas[index]["url"]!,
            _tarefas[index]["name"]!,
            _tarefas[index]["description"]!,
            () => _showFormEdit(context),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {_showForm(context)},
        child: Icon(Icons.add),
      ),
    );
  }
}

class Tarefa extends StatelessWidget {
  String image_link;
  String name;
  String description;
  VoidCallback onEdit;

  Tarefa(
    this.image_link,
    this.name,
    this.description,
    this.onEdit, {
    super.key,
  });

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
                          onPressed: onEdit,
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
