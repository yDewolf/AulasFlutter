// screens/home.dart
import 'package:flutter/material.dart';
import 'package:projeto_pet_shop/classes/GeneralUtils.dart';
import 'package:projeto_pet_shop/classes/Pet.dart';
import 'package:projeto_pet_shop/components.dart';
import 'package:projeto_pet_shop/screens/pet_register.dart';

class HomePage extends StatefulWidget{
  final List<Pet> pets;
  HomePage({super.key, required this.pets});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PetList(pets: widget.pets);
  }
}

class PetList extends StatefulWidget {
  final List<Pet> pets;
  PetList({super.key, required this.pets});

  @override
  State<StatefulWidget> createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  void _deletePet(int index) {
    setState(() {
      widget.pets.removeAt(index);
    });
  }
  
  void deletePet(int index) {
    GeneralUtils.showConfirmForm(
      context,
      "Tem certeza que deseja remover este pet?",
      () {
        _deletePet(index);
      }
    );
  }

  void _editPet(int index, Pet petData) {
    setState(() {
      widget.pets[index] = petData;
    });
  }

  void editPet(int index) {
    Pet petData = widget.pets[index];
    showDialog(
      context: context, 
      builder: (context) {
        return Dialog(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: PetEditForm(pets: widget.pets, petData: petData,)),
        );
    });

    _editPet(index, petData);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: widget.pets.length,
        itemBuilder: (BuildContext context, int index) {
            return PetCard(
              petData: widget.pets[index],
              editPet: () {
                editPet(index);
              },
              deletePet: () {
                deletePet(index);
              },
            );
        }
      ),
    );
  }
  
}