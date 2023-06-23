import 'package:flutter/material.dart';
import 'package:flutter_recetas/models/recipe_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardDetailsFavoritePage extends StatefulWidget {
  final Recipe_details recipeFavorite;

  CardDetailsFavoritePage({this.recipeFavorite});

  @override
  _CardDetailsFavoritePageState createState() =>
      _CardDetailsFavoritePageState();
}

class _CardDetailsFavoritePageState extends State<CardDetailsFavoritePage> {
  bool isFavorite = false;

  void addToFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String recipeId = widget.recipeFavorite.name.toString();
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
    String recipeId = widget.recipeFavorite.name.toString();
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
    String recipeId = widget.recipeFavorite.name.toString();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    if (favorites.contains(recipeId)) {
      setState(() {
        isFavorite = true;
      });
    }
  }

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
                      widget.recipeFavorite.images ?? '',
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
                            widget.recipeFavorite.name ?? '',
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
                            Icons.timer,
                            color: Colors.black,
                            size: 16,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '${widget.recipeFavorite.totalTime} min',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          SizedBox(width: 16),
                          Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 16,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '${widget.recipeFavorite.mobileSectionName} servings',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Ingredients:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        widget.recipeFavorite.ingredientLines ?? '',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Steps:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        widget.recipeFavorite.preparationSteps ?? '',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
