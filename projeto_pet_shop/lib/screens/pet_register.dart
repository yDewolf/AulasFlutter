// screens/pet_register.dart
import 'package:flutter/material.dart';
import 'package:projeto_pet_shop/components.dart';

class PetRegister extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _PetRegisterState();

}

class _PetRegisterState extends State<PetRegister> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          TextField(decoration: InputDecoration(labelText: "Nome do Pet"),)
        ],
    );
  }
}