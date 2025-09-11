// classes/GeneralUtils.dart
import 'package:flutter/material.dart';

class GeneralUtils {
  static void showConfirmForm(BuildContext context, String message, VoidCallback onConfirm) {
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
}