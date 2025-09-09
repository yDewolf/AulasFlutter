// screens/home.dart
import 'package:flutter/material.dart';
import 'package:projeto_pet_shop/components.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("HIIII you are on the home page")
      ],
    );
  }
}