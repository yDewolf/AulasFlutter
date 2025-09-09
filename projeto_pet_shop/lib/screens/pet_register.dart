// screens/pet_register.dart
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_pet_shop/components.dart';

class PetRegister extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _PetRegisterState();

}


// Código principalmente do:
// https://api.flutter.dev/flutter/material/DropdownMenu-class.html
typedef IconEntry = DropdownMenuEntry<PetTypes>;

enum PetTypes {
  dog('Cachorro', Icons.pets),
  cat('Gato', Icons.cloud_outlined),
  parrot('Papagaio', Icons.brush_outlined),
  bird('Pássaro', Icons.favorite);

  const PetTypes(this.label, this.icon);
  final String label;
  final IconData icon;

  static final List<IconEntry> entries = UnmodifiableListView<IconEntry>(
    values.map<IconEntry>(
      (PetTypes icon) => IconEntry(value: icon, label: icon.label, leadingIcon: Icon(icon.icon)),
    ),
  );
}

class _PetRegisterState extends State<PetRegister> {
  final TextEditingController nameController = TextEditingController();
  PetTypes? selectedPetType;
  final TextEditingController raceController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController imageControler = TextEditingController();

  void _showConfirmForm(BuildContext context, String message, VoidCallback onConfirm) {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirme sua ação"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, 
              child: Text("Cancelar")
            ),
            TextButton(
              onPressed: () {
                onConfirm();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white), 
              child: Text("Confirmar"),
            ),
          ],
        );
      }
    );
  }

  void confirmPetRegister() {
    // Fazer alguma coisa para salvar o pet eu acho
    print(nameController.text);
    print(raceController.text);
    print(ageController.text);
    print(imageControler.text);
    print(selectedPetType?.label);
  }
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Fields
        Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Nome do Pet"
              ),
            ),
            DropdownMenu<PetTypes>(
              label: Text("Tipo de pet"),
              dropdownMenuEntries: PetTypes.entries,
              onSelected: (PetTypes? petType) {
                if (petType is PetTypes) {
                  selectedPetType = petType;
                }
              },
            ),
            TextField(
              controller: raceController,
              decoration: InputDecoration(
                labelText: "Raça"
              ),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                labelText: "Idade em anos"
              ),
            ),
            TextField(
              controller: imageControler,
              decoration: InputDecoration(
                labelText: "Url Foto (opcional)"
              ),
            ),
          ],
        ),
        Row(
          children: [
            TextButton(
              child: Text("Salvar"),
              onPressed: () {
                List<String> missingFields = [];
                final Map<String, TextEditingController> requiredFields = {
                  "Nome": nameController,
                  "Idade": ageController,
                };
                for (var fieldName in requiredFields.keys) {
                  if (requiredFields[fieldName]!.text.isNotEmpty) {
                    continue;
                  }
                  missingFields.add(fieldName);
                }

                if (selectedPetType == null) {
                  missingFields.add("Tipo de Pet");
                }

                if (missingFields.isNotEmpty) {
                  String message = "Você deve preencher os campos: ";
                  int idx = 0;
                  for (var field in missingFields) {
                    if (idx != 0) {
                      message += ", ";
                    }
                    idx += 1;
                    message += field;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }

                _showConfirmForm(
                  context, 
                  "Tem certeza que quer cadastrar esse pet?",
                  confirmPetRegister
                );
              }
            ),
            TextButton(
              child: Text("Cancelar"),
              onPressed: () {
                
              }, 
            ),
          ],
        )
      ],
    );
  }
}