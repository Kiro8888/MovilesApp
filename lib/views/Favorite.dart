import 'package:flutter/material.dart';
import 'package:flutter_recetas/models/recipe_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_recetas/views/home.dart';
import 'package:flutter_recetas/views/CardDetailsFavoritePage.dart';
import 'package:flutter_recetas/views/CardDetailPage.dart';

class FavoritePage extends StatefulWidget {
  final Recipe_details recipeFavo;

  FavoritePage({this.recipeFavo});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<String> favoriteRecipes = [];

  @override
  void initState() {
    super.initState();
    getFavoriteRecipes();
  }

  void getFavoriteRecipes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    setState(() {
      favoriteRecipes = favorites;
    });
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
            PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: Text('Lista recetas'),
                  value: 'opcion1',
                ),
                PopupMenuItem(
                  child: Text('Favoritos'),
                  value: 'opcion2',
                ),
              ],
              onSelected: (value) {
                if (value == 'opcion1') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else if (value == 'opcion2') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavoritePage()),
                  );
                }
              },
              icon: Icon(
                Icons.menu,
                color: Color.fromARGB(
                  255,
                  0,
                  0,
                  0,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          String recipeName = favoriteRecipes[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.image),
              title: Text(recipeName ?? ''),
            ),
          );
        },
      ),
    );
  }
}
