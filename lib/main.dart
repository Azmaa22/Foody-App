import 'package:flutter/material.dart';
import 'package:flutter_apis/business_logic/cubits/recipe_cubit/recipe_cubit.dart';
import 'package:flutter_apis/presentation/screens/recipes_screen/recipes_screen.dart';
import 'package:flutter_apis/presentation/screens/splash_screen/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
