// components.dart
import 'package:flutter/material.dart';
import 'package:projeto_pet_shop/classes/Pet.dart';

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

class PetCard extends StatelessWidget {
  final Pet petData;
  const PetCard({super.key, required this.petData});

  @override
  Widget build(BuildContext context) {
    final double imageWidth = 200.0;
    final double imageHeight = 200.0;
    
    return SizedBox(
      width: imageWidth,
      height: imageHeight + 70.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Builder(builder: (context) {
            if (petData.imageUrl == null) {
              return Container(
                color: Colors.grey,
                width: imageWidth,
                height: imageHeight,
              );
            } 
            return Image.network(petData.imageUrl ?? "", width: imageWidth, height: imageHeight,);
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: 10,
            children: [
              Column(
                children: [
                  Icon(Icons.text_fields),
                  Text(petData.name),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.pets),
                  Text(petData.petType.label),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
  
}