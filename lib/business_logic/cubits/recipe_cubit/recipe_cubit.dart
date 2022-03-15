import 'package:bloc/bloc.dart';
import 'package:flutter_apis/data/models/recipe_model.dart';
import 'package:flutter_apis/data/repos/recipe_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit() : super(RecipeInitial());
  late List<Recipe> recipes;
  static RecipeCubit get(context) => BlocProvider.of(context);

  void getAllRecipes() {
    emit(RecipesLoadingState());
    RecipeRepository.getRecipes().then((value) {
      recipes = value;
      emit(RecipesSuccessState());
    }).catchError((error) {
      print('error ${error.toString()}');
      emit(RecipesErrorState());
    });
  }
}
