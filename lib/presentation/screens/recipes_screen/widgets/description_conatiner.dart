import 'package:flutter/material.dart';

class DescriptionContainer extends StatelessWidget {
  final String value, description;
  const DescriptionContainer(
      {Key? key, required this.value, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(description),
      ],
    );
  }
}
