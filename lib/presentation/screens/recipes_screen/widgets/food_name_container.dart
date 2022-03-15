import 'package:flutter/material.dart';

class FoodNameContainer extends StatelessWidget {
  final String foodName;
  const FoodNameContainer({Key? key, required this.foodName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        foodName,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          //  overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
