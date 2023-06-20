import 'package:flutter/material.dart';
import 'package:flutter_recetas/views/CardDetailPage.dart';
import 'package:flutter_recetas/views/CardDetailPage.dart';
import 'package:flutter/src/material/material_state.dart';
import 'package:flutter_recetas/models/recipe.dart';
import 'package:flutter_recetas/models/recipe_details.dart';

import 'package:flutter_recetas/views/CardDetailPageMaquetado.dart';

class RecipeCard extends StatelessWidget {
  final String id;
  final String title;
  final String rating;
  final String thumbnailUrl;
  final Recipe_details recipe;

  RecipeCard({
    @required this.id,
    @required this.title,
    @required this.rating,
    @required this.thumbnailUrl,
    this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: NetworkImage(thumbnailUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.black,
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
            alignment: Alignment.bottomLeft,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                onPressed: () {
                  // if (recipe != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardDetailPage(),
                    ),
                  );
                  // } else {
                  // La variable recipe es nula, puedes mostrar un mensaje de error o realizar alguna otra acción.
                  //   print('La variable recipe es nula');
                  // }
                },
                child: Text(
                  'Ver más',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
