import 'package:flutter/material.dart';
import 'package:test_task/screens/widgets/hero_picture_widget.dart';

class HeroesRow extends StatelessWidget {
  const HeroesRow(
      {super.key,
      required this.pictures,
      required this.height,
      required this.width});
  final List<String> pictures;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: pictures
          .map((e) => HeroePicture(assetName: e, height: height, width: width))
          .toList(),
    );
  }
}
