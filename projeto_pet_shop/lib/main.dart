// main.dart
import 'package:flutter/material.dart';
import 'package:projeto_pet_shop/classes/AppVariables.dart';
import 'package:projeto_pet_shop/classes/Pet.dart';
import 'package:projeto_pet_shop/navigator.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});
  final AppVariables app_variables = AppVariables(); 

  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    setState(() {
      widget.app_variables.pets.add(Pet(name: "name", race: "race", age: -1, petType: PetTypes.dog));
    });

    return MaterialApp(
      title: "PetShop!",
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      debugShowCheckedModeBanner: false,
      home: PageNavigator(app_variables: widget.app_variables,)
    );
  }
  
}