import 'package:flutter/material.dart';
import 'package:test_task/screens/video_page.dart';
import 'package:test_task/screens/widgets/hero_picture_widget.dart';
import 'package:test_task/styles/app_colors.dart';
import 'package:test_task/styles/text_styles.dart';

class HeroPopUp extends StatelessWidget {
  const HeroPopUp({
    super.key,
    required this.assetName,
  });
  final String assetName;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Dialog(
      child: Container(
        padding:
            const EdgeInsets.only(left: 60, right: 60, top: 20, bottom: 10),
        height: height,
        width: 100,
        decoration: BoxDecoration(
            color: AppColors.mainLight,
            borderRadius: BorderRadius.circular(40)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroWidget(
              assetName: assetName,
              height: height * 0.4,
              width: width * 0.2,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Фамилия Длинноеимя\nОтчество',
              style: AppTextStyles.nameStyle,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'длинная должность',
              style: AppTextStyles.descritionStyle.copyWith(fontSize: 10),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Lorem ipsum',
              style: AppTextStyles.descritionStyle
                  .copyWith(fontSize: 12, fontStyle: FontStyle.normal),
            ),
            const SizedBox(
              height: 15,
            ),
            const WatchButton(),
          ],
        ),
      ),
    );
  }
}

class WatchButton extends StatelessWidget {
  const WatchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const VideoPage(),
        ),
      ),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            'Смотреть интервью',
            style: TextStyle(
                color: AppColors.mainLight, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
