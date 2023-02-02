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
        padding: const EdgeInsets.only(left: 10, top: 10),
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
              width: 20,
            ),
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
                    MapWidget(
                      heigth: height,
                      width: width,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AllHeroesPage(),
                          ),
                        ),
                        child: const GreyContainerWidget(
                            assetName: 'assets/icons/all_heroes.svg'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget({super.key, required this.width, required this.heigth});
  final double width;
  final double heigth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.4,
      height: heigth * 0.7,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/First_floor_map.png'),
        ),
      ),
    );
  }
}
