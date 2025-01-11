import 'package:flutter/material.dart';

class AddSoulPage extends StatefulWidget {
  @override
  _AddSoulPageState createState() => _AddSoulPageState();
}

class _AddSoulPageState extends State<AddSoulPage> {
  final _nameController = TextEditingController();

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
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            // NFCタグを読み込んでIDを取得するボタン
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {
                },
                child: const Text('Read NFC Tag'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {
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