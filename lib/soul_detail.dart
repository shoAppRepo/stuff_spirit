import 'package:flutter/material.dart';
import 'package:stuff_spirit/colors.dart';

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
          ],
        ),
      ),
    );
  }
}