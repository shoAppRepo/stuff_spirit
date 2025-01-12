import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SoulDetailPage extends StatelessWidget {
  final Map<String, dynamic> soul;

  const SoulDetailPage({super.key, required this.soul});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(soul['name']),
        centerTitle: true,
        foregroundColor: Colors.black,
        elevation: 0,
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
                  backgroundImage: Image.asset(soul['icon_url']).image,
                ),
              ),
            const SizedBox(height: 100),
            SizedBox(
              height: 300,
              child: RadarChart(
                RadarChartData(
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
                      borderColor: Colors.yellow,
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
            )
          ],
        ),
      ),
    );
  }
}