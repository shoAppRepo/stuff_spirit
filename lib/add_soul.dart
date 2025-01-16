import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stuff_spirit/colors.dart';
import 'package:stuff_spirit/db/database_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
// material.dartとdriftの両方にColumnクラスがあるため
import 'package:drift/drift.dart' as drift;

class AddSoulPage extends StatefulWidget {
  const AddSoulPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddSoulPageState createState() => _AddSoulPageState();
}

class _AddSoulPageState extends State<AddSoulPage> {
  final _nameController = TextEditingController();
  final _nfcController = TextEditingController();
  final _imageController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String _imagePath = '';

  // 画像を選択してそのパスをTextEditingControllerに格納
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // アプリのディレクトリに画像をコピー
      final directory = await getApplicationDocumentsDirectory();
      // 一時的な画像のパス
      final imagePath = join(directory.path, basename(image.path));
      final File newImage = File(imagePath);
      // 画像の永続化
      await File(image.path).copy(newImage.path);

      // 画像のパスをコントローラにセット
      if (mounted) {
        setState(() {
          _imagePath = imagePath;
          _imageController.text = _imagePath; // コントローラに格納
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Soul'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nfcController,
              decoration: InputDecoration(
                labelText: 'NFC ID',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: _pickImage, // 画像選択処理を実行
              child: AbsorbPointer(
                child: TextField(
                  controller: _imageController,
                  decoration: InputDecoration(
                    labelText: 'Icon',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  readOnly: true, // 画像のパスはユーザーが編集しないようにする
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                final soul = SoulsCompanion(
                  name: drift.Value(_nameController.text),
                  nfcId: drift.Value(_nfcController.text),
                  iconUrl: drift.Value(_imageController.text),
                );
                DatabaseHelper().addSoul(soul);

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.warmYellow,
                padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text(
                'Add Soul',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
