// screens/home.dart
import 'package:flutter/material.dart';
import 'package:projeto_pet_shop/classes/Pet.dart';

class HomePage extends StatefulWidget{
  final List<Pet> pets;
  HomePage({super.key, required this.pets});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("HIIII you are on the home page"),
        Builder(builder: (BuildContext context) {
          for (var pet in widget.pets) {
              return Text(pet.name);
          }

          return Text("No Pet Was Found");
        })
      ],
    );
  }
}