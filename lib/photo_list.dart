// lib/photo_list.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stuff_spirit/db/database_helper.dart';

class PhotoListPage extends StatefulWidget {
  final int soulId;

  const PhotoListPage({super.key, required this.soulId});

  @override
  _PhotoListPageState createState() => _PhotoListPageState();
}

class _PhotoListPageState extends State<PhotoListPage> {
  List<Photo> photos = [];

  @override
  void initState() {
    super.initState();
    fetchPhotos();
  }

  Future<void> fetchPhotos() async {
    final data = await DatabaseHelper().getPhotosBySoulId(widget.soulId);
    setState(() {
      photos = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.yellow[100],
      ),
      body: photos.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: photos.length,
              itemBuilder: (context, index) {
                final photo = photos[index];
                return Card(
                  child: Image.file(
                    File(photo.photoUrl),
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
    );
  }
}