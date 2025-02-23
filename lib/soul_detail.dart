import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:video_player/video_player.dart';
import 'package:stuff_spirit/colors.dart';
import 'package:stuff_spirit/db/database_helper.dart';
import 'package:stuff_spirit/photo_list.dart';

class SoulDetailPage extends StatefulWidget {
  final Soul soul;

  const SoulDetailPage({super.key, required this.soul});

  @override
  _SoulDetailPageState createState() => _SoulDetailPageState();
}

class _SoulDetailPageState extends State<SoulDetailPage> {
  late VideoPlayerController _videoController;
  bool _showSoulAnimation = false;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/videos/soul_transfer.MP4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  void _triggerSoulAnimation() {
    setState(() {
      _showSoulAnimation = true;
    });

    _videoController
      ..setLooping(false)
      ..play();

    _videoController.addListener(() {
      if (_videoController.value.position >= _videoController.value.duration) {
        setState(() {
          _showSoulAnimation = false;
        });
      }
    });
  }

  Widget buildRadarChart() {
    return SizedBox(
      height: 300,
      child: RadarChart(
        RadarChartData(
          radarShape: RadarShape.polygon,
          radarBorderData: const BorderSide(
            color: MyColors.warmYellow,
          ),
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          tickCount: 3,
          tickBorderData: const BorderSide(width: 1),
          getTitle: (index, angle) {
            switch (index) {
              case 0:
                return RadarChartTitle(text: 'Memories');
              case 1:
                return RadarChartTitle(text: 'Emotions');
              case 2:
                return RadarChartTitle(text: 'Places');
              case 3:
                return RadarChartTitle(text: 'Photos');
              case 4:
                return RadarChartTitle(text: 'Time');
              default:
                return RadarChartTitle(text: '');
            }
          },
          dataSets: [
            RadarDataSet(
              borderColor: MyColors.warmYellow,
              fillColor: MyColors.warmYellow.withOpacity(0.5),
              dataEntries: [
                RadarEntry(value: 4),
                RadarEntry(value: 3),
                RadarEntry(value: 2),
                RadarEntry(value: 5),
                RadarEntry(value: 4),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSoulAnimation() {
    return _showSoulAnimation
        ? Positioned.fill(
            child: VideoPlayer(_videoController),
          )
        : const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9E6),
      appBar: AppBar(
        title: Text(
          widget.soul.name,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: _triggerSoulAnimation,
            icon: const Icon(Icons.file_upload),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: MyColors.warmYellow,
                    child: ClipOval(
                      child: Image.asset(
                        widget.soul.iconUrl,
                        fit: BoxFit.cover,
                        width: 190,
                        height: 190,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                SizedBox(
                  height: 300,
                  child: buildRadarChart(),
                ),
                const SizedBox(height: 70),
                Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: MyColors.warmYellow,
                        ),
                        child: const Text(
                          'Take a Photo',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PhotoListPage(soulId: widget.soul.id),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: MyColors.warmYellow,
                        ),
                        child: const Text(
                          'View Photos',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_showSoulAnimation)
            Positioned.fill(
              child: Stack(
                children: [
                  // 背景動画
                  Positioned.fill(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _videoController.value.size.width,
                        height: _videoController.value.size.height,
                        child: VideoPlayer(_videoController),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
