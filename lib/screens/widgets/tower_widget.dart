import 'package:flutter/material.dart';

class Tower extends StatelessWidget {
  const Tower({super.key, required this.assetName});
  final String assetName;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.25,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(assetName),
        ),
      ),
    );
  }
}
