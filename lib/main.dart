import 'package:flutter/material.dart';
import 'package:flutter_apis/business_logic/cubits/recipe_cubit/recipe_cubit.dart';
import 'package:flutter_apis/presentation/screens/recipes_screen/recipes_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<RecipeCubit>(
        create: (BuildContext context) => RecipeCubit()..getAllRecipes(),
        child: RecipesScreen(),
      ),
    );
  }
}
