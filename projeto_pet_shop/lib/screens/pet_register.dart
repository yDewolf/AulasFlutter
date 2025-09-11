// screens/pet_register.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_pet_shop/classes/GeneralUtils.dart';
import 'package:projeto_pet_shop/classes/Pet.dart';

class PetRegister extends StatefulWidget {
  final List<Pet> pets;
  PetRegister({super.key, required this.pets});

  @override
  State<StatefulWidget> createState() => _PetRegisterState();
}

class _PetRegisterState extends State<PetRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("Cadastro de pets", style: TextStyle(fontSize: 20.0),),
          PetEditForm(pets: widget.pets, onConfirm: () {}),
        ],
      ),
    );
  }

}

enum PetFormModes {
  Add,
  Edit
}

class PetEditForm extends StatefulWidget{
  final List<Pet> pets;
  Pet? petData;
  VoidCallback onConfirm;

  PetEditForm({super.key, required this.pets, this.petData, required this.onConfirm});

  @override
  State<StatefulWidget> createState() => _PetEditFormState();
}

class _PetEditFormState extends State<PetEditForm> {
  final TextEditingController nameController = TextEditingController();
  PetTypes selectedPetType = PetTypes.cat;
  final TextEditingController raceController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  void _confirmPetRegister() {
    addPet(
      nameController.text,
      raceController.text,
      int.parse(ageController.text),
      selectedPetType,
      imageController.text
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Pet adicionado com sucesso!"),
        duration: Duration(seconds: 2),
      ),
    );

    widget.onConfirm();
  }

  void addPet(String name, String race, int age, PetTypes type, String imageUrl) {
    final Pet newPet = Pet(
      name: name, 
      race: race, 
      age: age, 
      petType: type,
      imageUrl: imageUrl
    );

    setState(() {
      widget.pets.add(newPet);
    });
  }

  void _confirmPetEdit() {
    editPet(
      nameController.text,
      raceController.text,
      int.parse(ageController.text),
      selectedPetType,
      imageController.text
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Pet editado com sucesso!"),
        duration: Duration(seconds: 2),
      ),
    );

    widget.onConfirm();
  }

  void editPet(String name, String race, int age, PetTypes type, String imageUrl) {
    if (widget.petData != null) {
      setState(() {
        widget.petData?.name = name;
        widget.petData?.race = race;
        widget.petData?.age = age;
        widget.petData?.petType = type;
        widget.petData?.imageUrl = imageUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 1 -> Adicionar
    // 2 -> Editar
    PetFormModes mode = PetFormModes.Add;
    if (widget.petData != null) {
      mode = PetFormModes.Edit;
      nameController.text = widget.petData!.name;
      raceController.text = widget.petData!.race;
      ageController.text = widget.petData!.age.toString();
      imageController.text = widget.petData!.imageUrl;
    }

    return Column(
      children: [
        // Fields
        Column(
          spacing: 10,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Nome do Pet"
              ),
            ),
            
            TextField(
              controller: raceController,
              decoration: InputDecoration(
                labelText: "Raça"
              ),
            ),
            Row(
              spacing: 10.0,
              children: [
                Flexible(
                  child: TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      labelText: "Idade em anos"
                    ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    PetTypes defaultPetType = PetTypes.cat; 
                    if (widget.petData != null) {
                      defaultPetType = widget.petData!.petType;
                    }
                
                    return DropdownMenu<PetTypes>(
                      label: Text("Tipo de pet"),
                      initialSelection: defaultPetType,
                      dropdownMenuEntries: PetTypes.entries,
                      onSelected: (PetTypes? petType) {
                        if (petType is PetTypes) {
                          setState(() {
                            selectedPetType = petType;
                          });
                        }
                      },
                    );
                  }
                ),
              ],
            ),
            TextField(
              controller: imageController,
              decoration: InputDecoration(
                labelText: "Url Foto (opcional)"
              ),
            ),
          ],
        ),
        Builder(builder: (context) {
          switch (mode) {
            case PetFormModes.Add: 
              return _PetAddButtons(nameController: nameController, ageController: ageController, selectedPetType: selectedPetType, confirmPetRegister: _confirmPetRegister);

            case PetFormModes.Edit:
              return _PetEditButtons(confirmPetEdit: _confirmPetEdit);
          }
        })
      ],
    );
  }
}

class _PetAddButtons extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController ageController;
  final PetTypes? selectedPetType;
  VoidCallback confirmPetRegister;

  _PetAddButtons({
    required this.nameController, 
    required this.ageController,
    required this.selectedPetType,
    required this.confirmPetRegister
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 10.0,
      children: [
        TextButton(
          child: Text("Cancelar"),
          onPressed: () {
            
          }, 
        ),
        TextButton(
          child: Text("Salvar"),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
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

            GeneralUtils.showConfirmForm(
              context, 
              "Tem certeza que quer cadastrar esse pet?",
              confirmPetRegister
            );
          }
        ),
      ],
    );
  }  
}

class _PetEditButtons extends StatelessWidget {
  VoidCallback confirmPetEdit;

  _PetEditButtons({required this.confirmPetEdit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 10.0,
      children: [
        TextButton(
          child: Text("Cancelar"),
          onPressed: () {
            Navigator.of(context).pop();
          }, 
        ),
        TextButton(
          child: Text("Salvar"),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {
            // Navigator.of(context).pop();
            GeneralUtils.showConfirmForm(
              context,
              "Tem certeza de que quer atualizar este pet?",
              () {
                confirmPetEdit();
                Navigator.pop(context);
              }
            );
          }, 
        ),
      ],
    );
  }
}