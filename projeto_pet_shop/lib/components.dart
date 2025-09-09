// components.dart
import 'package:flutter/material.dart';

class BaseBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.add), 
          label: "Cadastrar Pets"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pets), 
          label: "Consultar Pets"
        ),
      ]
    );
  }
    
}