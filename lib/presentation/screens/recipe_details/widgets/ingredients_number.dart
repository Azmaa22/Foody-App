import 'package:flutter/material.dart';

class IngredientsNumber extends StatelessWidget {
  final String number;
  const IngredientsNumber({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        number,
        style: const TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
