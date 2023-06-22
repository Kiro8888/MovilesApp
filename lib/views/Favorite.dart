import 'package:flutter/material.dart';
import 'package:flutter_recetas/models/recipe_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class favorite extends StatelessWidget {
  final Recipe_details recipe;
  bool isFavorite = false;

  favorite({this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 102, 26, 26),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 1),
            Text(
              'Foodie Favorites',
              style: TextStyle(
                fontFamily: 'DancingScript',
                color: Colors.black,
                fontSize: 32,
              ),
            ),
            SizedBox(width: 170),
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Color.fromARGB(
                    255, 0, 0, 0), // Cambia aquí el color del ícono
              ),
              onPressed: () {
                // Acciones al hacer clic en el ícono de menú
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(),
    );
  }
}
