import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stuff_spirit/colors.dart';

class SoulDetailPage extends StatelessWidget {
  final Map<String, dynamic> soul;

  const SoulDetailPage({super.key, required this.soul});

  Widget buildRadarChart() {
    return SizedBox(
      height: 300,
      child: RadarChart(
        RadarChartData(
          radarShape: RadarShape.polygon,
          radarBorderData: const BorderSide(
            color: MyColors.warmYellow, // 線の色
          ),
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          tickCount: 3, // 表示する数値の数
          tickBorderData: const BorderSide(
            width: 1,
          ),
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
              borderColor:  MyColors.warmYellow,
              fillColor:  MyColors.warmYellow.withOpacity(0.5),
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

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      // Handle the selected image
      print('Image path: ${image.path}');
    }
  }

  Widget buildCameraButton() {
    return ElevatedButton(
      onPressed: _pickImage,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: MyColors.warmYellow,
      ),
      child: const Text(
        'Take a Photo',
        style: TextStyle(fontSize: 20), // Adjust the font size as needed
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9E6), // 背景色
      appBar: AppBar(
        title: Text(
          soul['name'],
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (soul['icon_url'] != null)
              Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor:  MyColors.warmYellow, // 優しい黄色の背景
                  child: ClipOval(
                    child: Image.asset(
                      soul['icon_url'],
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
              child: buildCameraButton(),
            ),
          ],
        ),
      ),
    );
  }
}
