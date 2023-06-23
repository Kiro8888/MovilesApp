import 'package:flutter/material.dart';
// import 'package:flutter_recetas/models/recipe.api.dart';
import 'package:flutter_recetas/models/recipe.api.details.dart';
// import 'package:flutter_recetas/models/recipe.dart';
import 'package:flutter_recetas/models/recipe_details.dart';
import 'package:flutter_recetas/views/widgets/recipe_card.dart';
import 'package:flutter_recetas/views/Favorite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe_details> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApiDetails.getRecipe_details();
    setState(() {
      _isLoading = false;
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
                    255, 0, 0, 0), // Cambia aquí el color del ícono
              ),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                final recipe = _recipes[index]; // Obtén el objeto Recipe actual

                return RecipeCard(
                  id: recipe.id, // Pasa el ID al constructor de RecipeCard
                  title: recipe.name,

                  thumbnailUrl: recipe.images,
                  recipe: recipe,
                );
              },
            ),
    );
  }
}
