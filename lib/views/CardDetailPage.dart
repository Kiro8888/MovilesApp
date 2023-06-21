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
    print('TotalTime: ${recipe.totalTime}');
    print('keywords: ${recipe.keywords}');

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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            Container(
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
                  image: NetworkImage(
                    recipe.images ?? '',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          recipe.name ?? '',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.star,
                          color: Colors.black,
                          size: 16,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: 400,
                      height: 2,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SizedBox(width: 8),
                        Icon(
                          Icons.access_time,
                          color: Colors.black,
                          size: 16,
                        ),
                        Text(
                          recipe.totalTime,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(width: 250),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'Intermedio',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: 400,
                      height: 2,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Ingredientes',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    SizedBox(height: 8),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        ListView(
                          shrinkWrap: true,
                          children: recipe.keywords
                              .map((keyword) => Text(
                                    keyword,
                                    style: TextStyle(color: Colors.black),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
