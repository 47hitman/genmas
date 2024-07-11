// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../menu/level_1_menu.dart';
import '../models/hiddem_item.dart';
import '../services/globals.dart';

class HiddenObjectGameScreen extends StatefulWidget {
  const HiddenObjectGameScreen({super.key});

  @override
  _HiddenObjectGameScreenState createState() => _HiddenObjectGameScreenState();
}

class _HiddenObjectGameScreenState extends State<HiddenObjectGameScreen> {
  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();

  @override
  void initState() {
    super.initState();
    _play();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('aktivast1', aktivast1);
  }

  void _play() {
    _player.open(
      Audio('assets/soal1/Level 1 (aktivitas 1).m4a'),
      autoStart: true,
      showNotification: true,
    );
  }

  void _play2(sound) {
    _player.open(
      Audio(sound),
      autoStart: true,
      showNotification: true,
    );
  }

  List<HiddenItem> hiddenItems = [
    HiddenItem(
        imagePath: 'assets/soal1/ular.png', position: const Offset(20, 250)),
    HiddenItem(
        imagePath: 'assets/soal1/tupai.png', position: const Offset(260, 170)),
    HiddenItem(
        imagePath: 'assets/soal1/kelinci.png',
        position: const Offset(172, 290)),
    HiddenItem(
        imagePath: 'assets/soal1/kupukupu.png',
        position: const Offset(325, 203)),
    HiddenItem(
        imagePath: 'assets/soal1/burung.png', position: const Offset(120, 230)),
  ];

  Set<int> foundItems = {};

  void checkForHiddenItem(Offset position) {
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
        final List<String> compliments = [
          'assets/option/Bagus.m4a',
          'assets/option/Hebat.m4a',
          'assets/option/Pintar.m4a'
        ];
        final randomCompliment =
            compliments[Random().nextInt(compliments.length)];
        _play2(randomCompliment);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Kamu menemukan sebuah item!'),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1), // Adjust duration as needed
          ),
        );

        if (foundItems.length == hiddenItems.length) {
          showSuccessDialog();
        }
        return;
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Tidak ada item di sini, coba lagi!'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1), // Adjust duration as needed
      ),
    );
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.orange.shade100,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 35,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Selamat!',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ],
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/poin.png',
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 10),
              const Text(
                '10',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ],
          ),
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: TextButton(
                onPressed: () async {
                  setState(() {
                    aktivast1 = true;
                  });
                  _saveData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const menu1level()), // Replace SpecificPage with your target page
                  );
                },
                child: const Text(
                  'ok',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            // TextButton(
            //   child: const Text('OK'),
            //   onPressed: () {
            //     setState(() {
            //       aktivast1 = true;
            //     });
            //     _saveData();
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) =>
            //               const menu1level()), // Replace SpecificPage with your target page
            //     );
            //   },
            // ),
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
          checkForHiddenItem(details.localPosition);
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background7.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  // Background image or any other background widget
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: const EdgeInsets.only(top: 150),
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
                children: hiddenItems.asMap().entries.map((entry) {
                  int index = entry.key;
                  HiddenItem item = entry.value;
                  return Column(
                    children: [
                      Image.asset(item.imagePath, width: 50, height: 50),
                      if (foundItems.contains(index))
                        const Icon(Icons.check,
                            color: Colors.green,
                            size: 24) // Check mark or any other indicator
                      else
                        const SizedBox(
                            height: 24), // Placeholder to maintain space
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
