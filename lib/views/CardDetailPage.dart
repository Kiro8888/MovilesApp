import 'package:flutter/material.dart';
// import 'package:flutter_recetas/models/recipe.api.dart';
import 'package:flutter_recetas/models/recipe.api.details.dart';
// import 'package:flutter_recetas/models/recipe.dart';
import 'package:flutter_recetas/models/recipe_details.dart';
import 'package:flutter_recetas/views/widgets/recipe_card.dart';

class CardDetailPage extends StatefulWidget {
  final Recipe_details recipeId;

  CardDetailPage({this.recipeId});

  @override
  _CardDetailPageState createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  List<Recipe_details> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipe_details();
  }

  Future<void> getRecipe_details() async {
    _recipes = await RecipeApiDetails.getRecipe_details();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: _recipes.map((recipe) {
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
                      image: NetworkImage(recipe.images),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                recipe.name,
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
                              SizedBox(height: 8),
                              Text(
                                'ID: ${recipe.id}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
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
                    ],
                  ),
                );
              }).toList(),
            ),
    );
  }
}
