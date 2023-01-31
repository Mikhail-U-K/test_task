import 'package:flutter/material.dart';

class Allerhand extends StatelessWidget {
  const Allerhand({super.key, required this.height, required this.width});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.25,
      height: height * 0.1,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/Allerhand.png'),
        ),
      ),
    );
  }
}
