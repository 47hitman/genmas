import 'package:flutter/material.dart';

import '../models/hiddem_item.dart';

class HiddenObjectGameScreen extends StatefulWidget {
  const HiddenObjectGameScreen({super.key});

  @override
  _HiddenObjectGameScreenState createState() => _HiddenObjectGameScreenState();
}

class _HiddenObjectGameScreenState extends State<HiddenObjectGameScreen> {
  List<HiddenItem> hiddenItems = [
    HiddenItem(
        imagePath: 'assets/soal1/ular.png', position: const Offset(20, 100)),
    HiddenItem(
        imagePath: 'assets/soal1/tupai.png', position: const Offset(260, 20)),
    HiddenItem(
        imagePath: 'assets/soal1/kelinci.png',
        position: const Offset(172, 140)),
    HiddenItem(
        imagePath: 'assets/soal1/kupukupu.png',
        position: const Offset(325, 53)),
    HiddenItem(
        imagePath: 'assets/soal1/burung.png', position: const Offset(120, 80)),
  ];

  Set<int> foundItems = {};

  void _checkForHiddenItem(Offset position) {
    for (int i = 0; i < hiddenItems.length; i++) {
      final item = hiddenItems[i];
      final itemRect = Rect.fromLTWH(
        item.position.dx,
        item.position.dy,
        50, // Assuming each item is 50x50 pixels
        50,
      );

      if (itemRect.contains(position)) {
        setState(() {
          foundItems.add(i);
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Kamu menemukan sebuah item!')),
        );

        if (foundItems.length == hiddenItems.length) {
          _showSuccessDialog();
        }

        return;
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tidak ada item di sini, coba lagi!')),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selamat!'),
          content: const Text('Kamu berhasil menemukan semua gambar hewan!'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Temukan gambar hewan yang sama!',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: GestureDetector(
        onTapDown: (details) {
          _checkForHiddenItem(details.localPosition);
        },
        child: Column(
          children: [
            Stack(
              children: [
                // Background image or any other background widget
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 200,
                    width: 350,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/soal1/backgorund.png'),
                        fit: BoxFit
                            .cover, // You can adjust this to BoxFit.contain, BoxFit.fill, etc.
                      ),
                    ),
                  ),
                ),
                // Hidden items
                ...hiddenItems.asMap().entries.map((entry) {
                  int index = entry.key;
                  HiddenItem item = entry.value;

                  return Positioned(
                    left: item.position.dx,
                    top: item.position.dy,
                    child: foundItems.contains(index)
                        ? Image.asset(
                            item.imagePath,
                            width: 50,
                            height: 50,
                          )
                        : Container(
                            width: 50,
                            height: 50,
                            color: Colors.transparent,
                          ),
                  );
                }).toList(),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/soal1/ular.png', width: 50, height: 50),
                Image.asset('assets/soal1/tupai.png', width: 50, height: 50),
                Image.asset('assets/soal1/kelinci.png', width: 50, height: 50),
                Image.asset('assets/soal1/kupukupu.png', width: 50, height: 50),
                Image.asset('assets/soal1/burung.png', width: 50, height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
