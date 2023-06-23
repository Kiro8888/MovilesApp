import 'dart:convert';
import 'package:flutter_recetas/models/recipe.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_recetas/models/recipe_details.dart';

class RecipeApiDetails {
  static Future<List<Recipe_details>> getRecipe_details() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "24", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'bf0995bf20mshb9bcd220d37a351p1eda82jsnbad2bd89510f',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']);
      // _temp.add(i['content']['details']);
    }

    return Recipe_details.recipesFromSnapshot(_temp);
  }
}
