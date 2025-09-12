// screens/home.dart
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projeto_pet_shop/classes/GeneralUtils.dart';
import 'package:projeto_pet_shop/classes/Pet.dart';
import 'package:projeto_pet_shop/components.dart';
import 'package:projeto_pet_shop/screens/pet_register.dart';

class PetListPage extends StatefulWidget{
  final List<Pet> pets;
  PetListPage({super.key, required this.pets});

  @override
  State<StatefulWidget> createState() => _PetListPageState();
}

class _PetListPageState extends State<PetListPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 20.0,
        children: [
          Text(
            "Consultar Pets",
            style: TextStyle(fontSize: 20.0),
          ),
          Flexible(child: PetList(pets: widget.pets)),
        ],
      ),
    );
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: SizedBox(
            width: 400.0,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                spacing: 10,
                children: [
                  Text(
                    "Editando o pet: ${petData.name}",
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  PetEditForm(
                    pets: widget.pets, 
                    petData: petData, 
                    onConfirm: () {
                      _editPet(index, petData);
                    }
                  ),
                ],
              )
            ),
          ),
        );
    });

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
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
    );
  }
  
}