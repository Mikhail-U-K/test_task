import 'package:flutter/material.dart';
import 'package:test_task/screens/widgets/pop_up_widget.dart';
import 'package:test_task/styles/text_styles.dart';

class HeroePicture extends StatelessWidget {
  const HeroePicture(
      {super.key,
      required this.assetName,
      required this.height,
      required this.width});
  final String assetName;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => HeroPopUp(
          assetName: assetName,
        ),
      ),
      child: Column(
        children: [
          HeroWidget(
            height: height,
            width: width,
            assetName: assetName,
          ),
          Text(
            'Фамилия Длинноеимя\nОтчество',
            textAlign: TextAlign.center,
            style: AppTextStyles.nameStyle,
          ),
          Text(
            'должность',
            textAlign: TextAlign.center,
            style: AppTextStyles.duty,
          ),
        ],
      ),
    );
  }
}

class HeroWidget extends StatelessWidget {
  const HeroWidget(
      {super.key,
      required this.assetName,
      required this.height,
      required this.width});
  final String assetName;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(assetName),
        ),
      ),
    );
  }
}
