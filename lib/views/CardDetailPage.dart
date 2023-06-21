import 'package:flutter/material.dart';
import 'package:flutter_recetas/models/recipe_details.dart';

class CardDetailPage extends StatelessWidget {
  final Recipe_details recipe;

  CardDetailPage({this.recipe});

  @override
  Widget build(BuildContext context) {
    print('Recipe ID: ${recipe.id}');
    print('Recipe Name: ${recipe.name}');
    print('Recipe Images: ${recipe.images}');
    print('Recipe Rating: ${recipe.rating}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Receta'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recipe.id ?? '',
                style: TextStyle(color: Colors.black),
              ),
              Image.network(
                recipe.images ?? '',
                fit: BoxFit.cover,
              ),
              Text(
                recipe.name ?? '',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 16),
              // Mostrar los demás detalles de la receta específica aquí
            ],
          ),
        ),
      ),
    );
  }
}
