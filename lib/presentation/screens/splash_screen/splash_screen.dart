import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_apis/business_logic/cubits/recipe_cubit/recipe_cubit.dart';
import 'package:flutter_apis/presentation/screens/recipes_screen/recipes_screen.dart';
import 'package:flutter_apis/utilities/enums/splash_animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  Artboard? riveArtBoard;
  late RiveAnimationController controllerIdle;
  late RiveAnimationController controllerPressed;
  late RiveAnimationController controllerAnimation1;

  _startTimer() {
    _timer = Timer(
        const Duration(
          seconds: 4,
        ),
        _goToOnBoardingScreens);
  }

  _changeStateToPressed() {
    _timer = Timer(
      const Duration(
        seconds: 1,
      ),
      addPressedController,
    );
  }

  _changeStateToAnimation1() {
    _timer = Timer(
      const Duration(
        seconds: 2,
      ),
      addAnimation1Controller,
    );
  }

  void removeAllControllers() {
    riveArtBoard?.artboard.removeController(controllerIdle);
    riveArtBoard?.artboard.removeController(controllerPressed);
    riveArtBoard?.artboard.removeController(controllerAnimation1);
  }

  void addPressedController() {
    removeAllControllers();
    riveArtBoard?.artboard.addController(controllerPressed);
  }

  void addAnimation1Controller() {
    removeAllControllers();
    riveArtBoard?.artboard.addController(controllerAnimation1);
  }

  void _goToOnBoardingScreens() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider<RecipeCubit>(
          create: (BuildContext context) => RecipeCubit()..getAllRecipes(),
          child: const RecipesScreen(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
    _changeStateToPressed();
    _changeStateToAnimation1();
    controllerIdle = SimpleAnimation(SplashAnimationStates.Idle.name);
    controllerPressed = SimpleAnimation(SplashAnimationStates.Pressed.name);
    controllerAnimation1 = SimpleAnimation(
      'Animation 1',
    );
    rootBundle.load('assets/rives/cooking.riv').then((data) {
      final file = RiveFile.import(data);
      Artboard artboard = file.mainArtboard;
      artboard.addController(controllerIdle);
      setState(() {
        riveArtBoard = artboard;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: riveArtBoard == null
            ? const SizedBox.shrink()
            : Rive(
                artboard: riveArtBoard!,
              ),
      ),
    );
  }
}
