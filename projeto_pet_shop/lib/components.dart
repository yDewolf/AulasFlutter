// components.dart
import 'package:flutter/material.dart';
import 'package:projeto_pet_shop/classes/Pet.dart';

class PetCard extends StatelessWidget {
  final Pet petData;
  const PetCard({super.key, required this.petData, required this.deletePet, required this.editPet});
  final VoidCallback deletePet;
  final VoidCallback editPet;

  @override
  Widget build(BuildContext context) {
    final double imageWidth = 200.0;
    final double imageHeight = 200.0;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 10,
                children: [
                  
                  Builder(builder: (context) {
                      if (petData.imageUrl == "") {
                        return Container(
                          color: Colors.grey,
                          width: imageWidth,
                          height: imageHeight,
                        );
                      } 
                      return Image.network(petData.imageUrl, width: imageWidth, height: imageHeight,);
                    }),
                  SizedBox(
                    width: imageWidth,
                    child: Row(
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
                    ),
                  ),
                  SizedBox(
                    width: imageWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 10,
                      children: [
                        IconButton(
                          onPressed: editPet,
                          icon: Icon(Icons.edit)
                        ),
                        IconButton(
                          onPressed: deletePet, 
                          icon: Icon(Icons.delete)
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ),
      ],
    );
  }
  
}