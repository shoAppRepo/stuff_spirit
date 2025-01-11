import 'package:flutter/material.dart';
import 'package:stuff_spirit/db/database_helper.dart';

class AddSoulPage extends StatefulWidget {
  @override
  _AddSoulPageState createState() => _AddSoulPageState();
}

class _AddSoulPageState extends State<AddSoulPage> {
  final _nameController = TextEditingController();
  final _nfcController = TextEditingController();

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
            TextField(
              controller: _nfcController,
              decoration: const InputDecoration(
                labelText: 'NFC ID',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  DatabaseHelper.instance.insertSoul({
                    'name': _nameController.text,
                    'nfc_id': _nfcController.text,
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