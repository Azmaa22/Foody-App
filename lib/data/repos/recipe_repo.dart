import 'package:flutter_apis/data/apis/recipe_api.dart';
import 'package:flutter_apis/data/models/recipe_model.dart';

class RecipeRepository {
  static Future<List<Recipe>> getRecipes() async {
    List<dynamic> recipes_temp = await RecipeApi.getAllRecipe();

    if (recipes_temp.isEmpty) {
      print('something error in repo');
      return [];
    } else {
      List<Recipe> recipes = recipes_temp
          .map<Recipe>((recipe) => Recipe.fromJson(recipe['recipe']))
          .toList();

      return recipes;
    }
  }
}
