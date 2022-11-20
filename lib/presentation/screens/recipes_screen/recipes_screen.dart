import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_apis/business_logic/cubits/recipe_cubit/recipe_cubit.dart';
import 'package:flutter_apis/presentation/screens/recipe_details/recipe_details.dart';
import 'package:flutter_apis/presentation/screens/recipes_screen/widgets/description_conatiner.dart';
import 'package:flutter_apis/presentation/screens/recipes_screen/widgets/food_name_container.dart';
import 'package:flutter_apis/presentation/screens/recipes_screen/widgets/image_container.dart';
import 'package:flutter_apis/presentation/screens/recipes_screen/widgets/more_button.dart';
import 'package:flutter_apis/presentation/screens/recipes_screen/widgets/source_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  final double viewportFraction = 0.8;
  late PageController controller;
  double pageOffset = 0.0;
  @override
  void initState() {
    super.initState();
    controller =
        PageController(initialPage: 0, viewportFraction: viewportFraction)
          ..addListener(() {
            setState(() {
              pageOffset = controller.page!;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Foody App',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        elevation: 0.0,
      ),
      body: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          RecipeCubit myCubit = RecipeCubit.get(context);
          if (state is RecipesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          } else if (state is RecipesErrorState) {
            return const Center(
              child: Text('error'),
            );
          } else if (state is RecipesSuccessState) {
            return PageView.builder(
              itemBuilder: (context, index) {
                double scale = max(viewportFraction,
                    (1 - (pageOffset - index).abs() + viewportFraction));

                return Container(
                  margin: EdgeInsets.only(
                    bottom: 100 - scale * 0.1,
                    top: 100 - scale * 30,
                    right: 30,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.green,
                          width: 1.0,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageContainer(
                            image:
                                RecipeCubit.get(context).recipes[index].image),
                        const SizedBox(
                          height: 20,
                        ),
                        FoodNameContainer(
                            foodName:
                                RecipeCubit.get(context).recipes[index].label),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.065,
                          decoration: const BoxDecoration(
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                            color: Colors.green,
                            width: 1.0,
                          ))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              DescriptionContainer(
                                  value:
                                      '${RecipeCubit.get(context).recipes[index].calories.round()}',
                                  description: 'Calories'),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.065,
                                width: 1,
                                color: Colors.green,
                                margin: const EdgeInsets.all(10.0),
                              ),
                              DescriptionContainer(
                                  value:
                                      '${RecipeCubit.get(context).recipes[index].ingredients.length}',
                                  description: 'Ingredients'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        SourceContainer(
                            value:
                                RecipeCubit.get(context).recipes[index].source,
                            description: 'Recipe Source :'),
                        const SizedBox(height: 20.0),
                        MoreButton(
                            title: 'More Details',
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecipeDetails(
                                    recipe: myCubit.recipes[index],
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                );
              },
              itemCount: RecipeCubit.get(context).recipes.length,
              controller: controller,
            );
          } else {
            return Container(
              color: Colors.amber,
            );
          }
        },
      ),
    );
  }
}
