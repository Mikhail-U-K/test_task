import 'package:flutter/material.dart';
import 'package:test_task/styles/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GreyContainerWidget extends StatelessWidget {
  const GreyContainerWidget({super.key, required this.assetName});
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 95,
      decoration: BoxDecoration(
        color: AppColors.buttonSecondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: SvgPicture.asset(
          assetName,
          width: 24,
          height: 40,
        ),
      ),
    );
  }
}
