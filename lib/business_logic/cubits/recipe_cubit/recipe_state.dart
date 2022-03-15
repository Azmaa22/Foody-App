part of 'recipe_cubit.dart';

@immutable
abstract class RecipeState {}

class RecipeInitial extends RecipeState {}

class RecipesLoadingState extends RecipeState {}

class RecipesSuccessState extends RecipeState {}

class RecipesErrorState extends RecipeState {}
