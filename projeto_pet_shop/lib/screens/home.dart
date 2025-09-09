// screens/home.dart
import 'package:flutter/material.dart';
import 'package:projeto_pet_shop/classes/Pet.dart';
import 'package:projeto_pet_shop/components.dart';

class HomePage extends StatefulWidget{
  final List<Pet> pets;
  HomePage({super.key, required this.pets});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final pets = widget.pets;

    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: pets.length,
      itemBuilder: (BuildContext context, int index) {
          return PetCard(petData: pets[index],);
      }
    );
  }
}