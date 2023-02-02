import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task/screens/widgets/heroes_row.dart';
import 'package:test_task/styles/app_colors.dart';
import 'package:test_task/styles/text_styles.dart';

class AllHeroesPage extends StatefulWidget {
  const AllHeroesPage({super.key});

  @override
  State<AllHeroesPage> createState() => _AllHeroesPageState();
}

class _AllHeroesPageState extends State<AllHeroesPage> {
  List<String> first = [
    'assets/heroes_images/first_hero.png',
    'assets/heroes_images/second_hero.png',
    'assets/heroes_images/third_hero.png',
    'assets/heroes_images/fourth_hero.png',
  ];

  List<String> second = [
    'assets/heroes_images/fifth_hero.png',
    'assets/heroes_images/sixth_hero.png',
    'assets/heroes_images/seventh_hero.png',
    'assets/heroes_images/eighth_hero.png',
  ];
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  // @override
  // dispose() {
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.landscapeRight,
  //     DeviceOrientation.landscapeLeft,
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.mainLight,
      body: Container(
        padding:
            EdgeInsets.only(left: width * 0.01, top: 10, bottom: height * 0.01),
        child: Row(
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset('assets/icons/arrow_back.svg'),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Все герои',
                  style: AppTextStyles.headerStyle,
                ),
                Text(
                  'Название этажа',
                  style: AppTextStyles.headerStyle2,
                ),
                HeroesRow(
                    pictures: first,
                    height: height * 0.27,
                    width: width * 0.15),
                Text(
                  'Название этажа',
                  style: AppTextStyles.headerStyle2,
                ),
                HeroesRow(
                    pictures: second,
                    height: height * 0.27,
                    width: width * 0.15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
