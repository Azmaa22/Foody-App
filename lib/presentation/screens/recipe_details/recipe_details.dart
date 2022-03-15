import 'package:flutter/material.dart';
import 'package:flutter_apis/data/models/recipe_model.dart';
import 'package:flutter_apis/presentation/screens/recipe_details/widgets/ingredient_item.dart';
import 'package:flutter_apis/presentation/screens/recipe_details/widgets/ingredients_number.dart';

class RecipeDetails extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetails({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      appBar: AppBar(
        title: Text(
          '${recipe.label} Details',
          style: const TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(150.0),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(recipe.image),
                ),
              ),
            ),
            IngredientsNumber(
              number: '${recipe.ingredients.length} Ingredients',
            ),
            Column(
              children: [
                for (var item in recipe.ingredients)
                  Column(
                    children: [
                      IngredientItem(item: item),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1.0,
                        color: Colors.grey,
                        margin: const EdgeInsets.all(10.0),
                      ),
                    ],
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
