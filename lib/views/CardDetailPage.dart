import 'package:flutter/material.dart';
import 'package:flutter_recetas/models/recipe_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardDetailPage extends StatefulWidget {
  final Recipe_details recipe;

  CardDetailPage({this.recipe});

  @override
  _CardDetailPageState createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  bool isFavorite = false;

  void addToFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String recipeId = widget.recipe.toString();
    // String image = widget.recipe.images.toString();

    List<String> favorites = prefs.getStringList('favorites') ?? [];
    if (!favorites.contains(recipeId)) {
      favorites.add(recipeId);
      await prefs.setStringList('favorites', favorites);
    }
    setState(() {
      isFavorite = true;
    });
  }

  void removeFromFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String recipeId = widget.recipe.toString();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    if (favorites.contains(recipeId)) {
      favorites.remove(recipeId);
      await prefs.setStringList('favorites', favorites);
    }
    setState(() {
      isFavorite = false;
    });
  }

  @override
  void initState() {
    super.initState();
    checkFavoriteStatus();
  }

  void checkFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String recipeId = widget.recipe.toString();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    if (favorites.contains(recipeId)) {
      setState(() {
        isFavorite = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Recipe ID: ${widget.recipe.id}');
    print('Recipe Name: ${widget.recipe.name}');
    print('Recipe Images: ${widget.recipe.images}');
    print('Recipe Rating: ${widget.recipe.rating}');
    print('TotalTime: ${widget.recipe.totalTime}');

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
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.black,
              ),
              onPressed: () {
                if (isFavorite) {
                  removeFromFavorites();
                } else {
                  addToFavorites();
                }
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                      widget.recipe.images ?? '',
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
                            widget.recipe.name ?? '',
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
                            widget.recipe.totalTime,
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
                              widget.recipe.mobileSectionName,
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
                            children: widget.recipe.ingredientLines
                                .map((keyword) => Text(
                                      keyword,
                                      style: TextStyle(color: Colors.black),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                      Text(
                        'Preparación',
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
                            children: widget.recipe.preparationSteps
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
      ),
      bottomNavigationBar: Container(
        height: 36, // Ajusta la altura según tus necesidades
        child: ElevatedButton.icon(
          onPressed: () {
            // Acciones al hacer clic en el botón de regresar
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          label: Text('Regresar a la lista de recetas'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            minimumSize: MaterialStateProperty.all<Size>(
              Size(double.infinity, 36),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
