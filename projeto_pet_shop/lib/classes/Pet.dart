// classes/Pet.dart

// Código principalmente do:
// https://api.flutter.dev/flutter/material/DropdownMenu-class.html
import 'dart:collection';

import 'package:flutter/material.dart';

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

class Pet {
  String name;
  String race;
  int age;
  PetTypes petType;
  String imageUrl;

  Pet({
    required this.name, 
    required this.race, 
    required this.age, 
    required this.petType,
    required this.imageUrl
  });
}