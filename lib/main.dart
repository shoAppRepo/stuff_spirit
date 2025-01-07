import 'package:flutter/material.dart';
import 'package:stuff_spirit/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoulMate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFFF9E6)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'SoulMate'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 上部テキスト
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: const Text(
                'Spend time with your SoulMates',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4A4A4A), // 落ち着いた文字色
                  letterSpacing: 1.2,
                ),
              ),
            ),
            // イメージ
            Image.asset(
              'assets/images/bear.png',
              width: 180,
              height: 180,
            ),
            // ボタン
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.warmYellow, // 温かみのある黄色
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // 丸みを帯びたデザイン
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 40,
                  ),
                  shadowColor: const Color(0x55FFD966), // ボタンの影
                  elevation: 8,
                ),
                onPressed: () {
                  // ボタンが押された時の処理
                },
                child: const Text(
                  'Look into the Souls',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4A4A4A), // テキスト色を落ち着いたダークグレー
                    letterSpacing: 1.1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
