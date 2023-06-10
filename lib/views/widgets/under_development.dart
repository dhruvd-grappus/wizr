import 'package:flutter/material.dart';

class UnderDevelopment extends StatelessWidget {
  const UnderDevelopment({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Center(
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
