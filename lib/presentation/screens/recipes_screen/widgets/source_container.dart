import 'package:flutter/material.dart';

class SourceContainer extends StatelessWidget {
  final String value, description;
  const SourceContainer(
      {Key? key, required this.value, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(description)),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
