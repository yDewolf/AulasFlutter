// main.dart
import 'package:flutter/material.dart';
import 'package:projeto_pet_shop/classes/AppVariables.dart';
import 'package:projeto_pet_shop/navigator.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final AppVariables app_variables = AppVariables(); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PetShop!",
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      debugShowCheckedModeBanner: false,
      home: PageNavigator(app_variables: app_variables,)
    );
  }
}
