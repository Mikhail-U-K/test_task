import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task/styles/app_colors.dart';
import 'package:test_task/styles/text_styles.dart';
import 'package:test_task/texts/text_for_widgets.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainLight,
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 10),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Фамилия Имя Отчество',
                      style: AppTextStyles.headerStyle,
                    ),
                  ],
                ),
                Text(
                  'Lorem ipsum dolor sit amet\nLorem ipsum dolor sit ametLorem ipsum',
                  style: AppTextStyles.appNameStyle2.copyWith(fontSize: 20),
                ),
                const VideoWindow(),
                const SizedBox(
                  height: 10,
                ),
                const TextArea(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class VideoWindow extends StatefulWidget {
  const VideoWindow({super.key});

  @override
  State<VideoWindow> createState() => _VideoWindowState();
}

class _VideoWindowState extends State<VideoWindow> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/rick_roll.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.pause();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void playPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: 200,
      width: width * 0.5,
      child: _controller.value.isInitialized
          ? Builder(builder: (context) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  children: [
                    VideoPlayer(_controller),
                    Center(
                      child: IconButton(
                        iconSize: 60,
                        color: AppColors.mainLight,
                        onPressed: playPause,
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                      ),
                    ),
                    VideoProgressIndicator(_controller, allowScrubbing: true),
                  ],
                ),
              );
            })
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class TextArea extends StatefulWidget {
  const TextArea({super.key});

  @override
  State<TextArea> createState() => _TextAreaState();
}

class _TextAreaState extends State<TextArea> {
  bool isNotExpanded = true;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return isNotExpanded
        ? Container(
            width: width * 0.5,
            padding: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(width: 10, color: AppColors.primary),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  TextForWidgets.longText,
                  maxLines: 4,
                ),
                InkWell(
                  onTap: () => setState(() => isNotExpanded = false),
                  child: const Text(
                    'Читать полностью',
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ],
            ),
          )
        : Container(
            width: width * 0.5,
            height: 75,
            padding: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(width: 10, color: AppColors.primary),
              ),
            ),
            child: ListView(
              children: [
                const Text(
                  TextForWidgets.longText + TextForWidgets.longText,
                  maxLines: 7,
                ),
                InkWell(
                  onTap: () => setState(() => isNotExpanded = true),
                  child: const Text(
                    'Свернуть',
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ],
            ),
          );
  }
}
