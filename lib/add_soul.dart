import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stuff_spirit/db/database_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';

class AddSoulPage extends StatefulWidget {
  @override
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
      setState(() {
        _imagePath = imagePath;
        _imageController.text = _imagePath; // コントローラに格納
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Soul'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nfcController,
              decoration: const InputDecoration(
                labelText: 'NFC ID',
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _imageController,
              decoration: const InputDecoration(
                labelText: 'Image Path',
              ),
              readOnly: true, // 画像のパスはユーザーが編集しないようにする
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: _pickImage, // 画像選択ボタン
                child: const Text('Pick Image'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  DatabaseHelper.instance.insertSoul({
                    'name': _nameController.text,
                    'nfc_id': _nfcController.text,
                    'icon_url': _imageController.text,
                  });

                  Navigator.pop(context);
                },
                child: const Text('Add Soul'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}