import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task/screens/all_heroes_page.dart';
import 'package:test_task/screens/widgets/grey_container_widget.dart';
import 'package:test_task/styles/app_colors.dart';
import 'package:test_task/styles/text_styles.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final List<String> maps = [
    'assets/images/First_floor_map.png',
    'assets/images/Second_floor_map.png',
    'assets/images/Bottom_floor_map.png',
  ];
  bool leftIsPressed = true;
  bool centerIsPressed = false;
  bool rightIsPressed = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  void changeMap(int i) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.mainLight,
      body: Container(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Row(
          children: [
            Flexible(
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset('assets/icons/arrow_back.svg'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              flex: 10,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Карта',
                            style: AppTextStyles.headerStyle,
                          ),
                          Text(
                            'Первый этаж',
                            style: AppTextStyles.headerStyle2,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AllHeroesPage(),
                          ),
                        ),
                        child: const GreyContainerWidget(
                            assetName: 'assets/icons/all_heroes.svg'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          children: [
                            MapWidget(
                              assetName: maps[0],
                              heigth: height,
                              width: width,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                      color: AppColors.mainDark,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        width: 2.5,
                                        color: AppColors.mainDark,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                      color: AppColors.mainDark,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ContainerWithText(height: height, width: width),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget(
      {super.key,
      required this.width,
      required this.heigth,
      required this.assetName});
  final double width;
  final double heigth;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.4,
      height: heigth * 0.65,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(assetName),
        ),
      ),
    );
  }
}

class ContainerWithText extends StatelessWidget {
  const ContainerWithText(
      {super.key, required this.height, required this.width});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.7,
      width: width * 0.5,
      child: Center(
        child: ListView(
          children: List.generate(30, (index) {
            String text = 'Lorem ipsum dolor sit amet';
            if (index % 3 == 0) {
              text += text;
            } else if (index % 5 == 0) {
              text = text + text + text;
            }
            return Text(
              '$index  $text',
              style: const TextStyle(
                  color: AppColors.mainDark, fontWeight: FontWeight.w400),
            );
          }),
        ),
      ),
    );
  }
}
