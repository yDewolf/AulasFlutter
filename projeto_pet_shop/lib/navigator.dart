// navigator.dart
import 'package:flutter/material.dart';
import 'package:projeto_pet_shop/classes/AppVariables.dart';
import 'package:projeto_pet_shop/screens/home.dart';
import 'package:projeto_pet_shop/screens/pet_register.dart';

class PageNavigator extends StatefulWidget{
  final AppVariables app_variables;
  PageNavigator({super.key, required this.app_variables});

  @override
  State<StatefulWidget> createState() => _PageNavigatorState();
}

// Followed this tutorial here: 
// https://www.youtube.com/watch?v=8weH1KCr-mc&themeRefresh=1
// To do the navigator page controller thing
class _PageNavigatorState extends State<PageNavigator> {
  final PageController _pageController = PageController();

  int currentIdx = 0;

  void _onPageChanged(int index) {
    setState(() {
      currentIdx = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomePage(pets: widget.app_variables.pets), PetEditForm(pets: widget.app_variables.pets, onConfirm: () {},)
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("PetShop!"),
        backgroundColor: Colors.blueGrey,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.pets), 
            label: "Consultar Pets"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add), 
            label: "Cadastrar Pets"
          ),
      ]),
    );
  }
}