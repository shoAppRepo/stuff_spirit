import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stuff_spirit/colors.dart';
import 'package:stuff_spirit/db/database_helper.dart';
import 'package:stuff_spirit/photo_list.dart';

class SoulDetailPage extends StatelessWidget {
  final Soul soul;

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
      // アプリのディレクトリに画像をコピー
      final directory = await getApplicationDocumentsDirectory();
      // 一時的な画像のパス
      final imagePath = join(directory.path, basename(image.path));
      final File newImage = File(imagePath);
      // 画像の永続化
      await File(image.path).copy(newImage.path);

      await DatabaseHelper().addPhoto(
        PhotosCompanion.insert(
          photoUrl: imagePath,
          soulId: soul.id,
        ),
      );
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
        style: TextStyle(fontSize: 20),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9E6),
      appBar: AppBar(
        title: Text(
          soul.name,
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
            Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor:  MyColors.warmYellow,
                  child: ClipOval(
                    child: Image.asset(
                      soul.iconUrl,
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
                  buildCameraButton(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PhotoListPage(soulId: soul.id)),
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
    );
  }
}
