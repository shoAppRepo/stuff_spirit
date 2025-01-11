import 'package:flutter/material.dart';
import 'package:stuff_spirit/colors.dart';
import 'package:stuff_spirit/db/database_helper.dart';

class SoulsPage extends StatefulWidget {
  @override
  _SoulsPageState createState() => _SoulsPageState();
}

class _SoulsPageState extends State<SoulsPage> {
  List<Map<String, dynamic>> spirits = [];

  @override
  void initState() {
    super.initState();
    fetchSouls();
  }

  Future<void> fetchSouls() async {
    final data = await DatabaseHelper.instance.getAllSouls();
    setState(() {
      spirits = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Soul'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.yellow),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: spirits.length,
          itemBuilder: (context, index) {
            final item = spirits[index];
            return Card(
              color: Colors.yellow[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.asset(
                      item['icon_url']!,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: MyColors.warmYellow,
        child: const Icon(Icons.add, color: Colors.black),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // IconButton(
              //   icon: const Icon(Icons.share),
              //   onPressed: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }
}