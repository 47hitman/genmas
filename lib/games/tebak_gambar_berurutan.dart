import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../menu/level_1_menu.dart';
import '../services/globals.dart';

class TebakGambarBerurutanScreen extends StatefulWidget {
  const TebakGambarBerurutanScreen({super.key});

  @override
  _TebakGambarBerurutanScreenState createState() =>
      _TebakGambarBerurutanScreenState();
}

class _TebakGambarBerurutanScreenState
    extends State<TebakGambarBerurutanScreen> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();

    _play();
  }

  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();
  void _play() {
    _player.open(
      Audio(sound),
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

  void _checkAnswer(String selectedImage) {
    setState(() {
      if (selectedImage == images[(currentIndex + 3) % images.length]) {
        final List<String> compliments = [
          'assets/option/Bagus.m4a',
          'assets/option/Hebat.m4a',
          'assets/option/Pintar.m4a'
        ];
        final randomCompliment =
            compliments[Random().nextInt(compliments.length)];
        _play2(randomCompliment);
        _showDialog(true); // Menampilkan dialog jika jawaban benar
        currentIndex = (currentIndex + 1) % images.length;
      } else {
        _play2('assets/option/Ayo coba lagi.m4a');
        // _showDialog(false); // Menampilkan dialog jika jawaban salah
        // Show some feedback for incorrect answer
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Salah! Coba lagi.')),
        );
      }
    });
  }

  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('aktivast5', aktivast5);
  }

  // Method untuk menampilkan dialog berdasarkan status jawaban
  void _showDialog(bool correct) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(correct ? 'Jawaban Benar!' : 'Jawaban Salah!'),
          content: Text(correct
              ? 'Selamat! Anda menjawab dengan benar.'
              : 'Maaf, jawaban Anda salah. Silakan coba lagi.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                correct == true
                    ? setState(() {
                        aktivast5 = true;
                        _saveData();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const menu1level()), // Replace SpecificPage with your target page
                        );
                      })
                    : setState(() {
                        Navigator.of(context).pop();
                      });
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
        title: const Text('tebak gambar'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background5.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the current images in sequence
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    images[(currentIndex) % images.length],
                    height: 100,
                    width: 100,
                  ),
                  Image.asset(
                    images[(currentIndex + 1) % images.length],
                    height: 100,
                    width: 100,
                  ),
                  Image.asset(
                    images[(currentIndex + 2) % images.length],
                    height: 100,
                    width: 100,
                  ),
                  const Text(
                    "....",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  )
                ],
              ),
            ),
            const SizedBox(height: 50),
            // const Text(
            //   'Tebak gambar berikutnya:',
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(height: 20),
            // Display the options
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () => _checkAnswer(
                        images[(currentIndex + 3) % images.length]),
                    child: Image.asset(
                      images[(currentIndex + 3) % images.length],
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () => _checkAnswer(
                        images[(currentIndex + 4) % images.length]),
                    child: Image.asset(
                      images[(currentIndex + 4) % images.length],
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
