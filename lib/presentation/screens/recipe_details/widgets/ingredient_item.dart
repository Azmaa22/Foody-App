import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  final String item;
  const IngredientItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          const Text(
            '*',
            style: TextStyle(
              //color: Colors.green,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            flex: 3,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 20.0,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
