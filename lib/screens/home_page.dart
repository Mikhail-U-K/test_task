import 'package:flutter/material.dart';
import 'package:test_task/screens/widgets/allerhand_widget.dart';
import 'package:test_task/screens/widgets/grey_container_widget.dart';
import 'package:test_task/screens/widgets/map_button.dart';
import 'package:test_task/screens/widgets/tower_widget.dart';
import 'package:test_task/styles/app_colors.dart';
import 'package:flutter/services.dart';
import 'package:test_task/styles/text_styles.dart';
import 'package:test_task/texts/text_for_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Tower(assetName: 'assets/images/Изображение слева.png'),
          Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Allerhand(
                height: height,
                width: width,
              ),
              SizedBox(
                height: height * 0.025,
              ),
              AppNameWidget(
                height: height * 0.2,
                width: width * 0.45,
              ),
              SizedBox(
                height: height * 0.025,
              ),
              TextContainer(
                text: TextForWidgets.descriptionText,
                style: AppTextStyles.descritionStyle,
                height: height * 0.25,
                width: width * 0.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  GreyContainerWidget(assetName: 'assets/icons/info.svg'),
                  SizedBox(
                    width: 10,
                  ),
                  MapButton(),
                  SizedBox(
                    width: 10,
                  ),
                  GreyContainerWidget(
                      assetName: 'assets/icons/Instruction.svg'),
                ],
              ),
            ],
          ),
          const Tower(
            assetName: 'assets/images/Изображение справа.png',
          ),
        ],
      ),
    );
  }
}

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({super.key, required this.height, required this.width});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            TextForWidgets.bigHeader,
            style: AppTextStyles.appNameStyle1,
            textAlign: TextAlign.center,
          ),
          Text(
            TextForWidgets.smallHeader,
            style: AppTextStyles.appNameStyle2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class TextContainer extends StatelessWidget {
  const TextContainer(
      {super.key,
      required this.text,
      required this.style,
      required this.height,
      required this.width});
  final String text;
  final TextStyle style;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: style,
      ),
    );
  }
}
