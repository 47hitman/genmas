import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../../services/globals.dart';

class MatchingGameUjianScreen extends StatefulWidget {
  const MatchingGameUjianScreen({super.key});

  @override
  _MatchingGameUjianScreenState createState() =>
      _MatchingGameUjianScreenState();
}

class _MatchingGameUjianScreenState extends State<MatchingGameUjianScreen> {
  @override
  void initState() {
    super.initState();

    _play();
  }

  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();
  void _play() {
    _player.open(
      Audio('assets/soal1/Level 1 (aktivitas 6).m4a'),
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

  String? selectedImage;
  bool showSuccessDialog = false;

  void checkAnswer() {
    // Cek apakah gambar yang dipilih memiliki bentuk yang mirip dengan kubus (seperti dadu)
    if (selectedImage == options[0]['path']) {
      setState(() {
        for (int i = 1; i <= 10; i++) {
          if (ujian == i) {
            switch (i) {
              case 1:
                ujian1 = true;
                // soalujian1 = true;
                break;
              case 2:
                ujian2 = true;
                // soalujian2 = true;
                break;
              case 3:
                ujian3 = true;
                // soalujian3 = true;
                break;
              case 4:
                ujian4 = true;
                // soalujian4 = true;
                break;
              case 5:
                ujian5 = true;
                // soalujian5 = true;
                break;
              case 6:
                ujian6 = true;
                // soalujian6 = true;
                break;
              case 7:
                ujian7 = true;
                // soalujian7 = true;
                break;
              case 8:
                ujian8 = true;
                // soalujian8 = true;
                break;
              case 9:
                ujian9 = true;
                // soalujian9 = true;
                break;
              case 10:
                ujian10 = true;
                // soalujian10 = true;
                break;
            }
          }
        }
        showSuccessDialogWidget();
        showSuccessDialog = true;
      });
    } else {
      for (int i = 1; i <= 10; i++) {
        if (ujian == i) {
          switch (i) {
            case 1:
              ujian1 = false;
              break;
            case 2:
              ujian2 = false;
              break;
            case 3:
              ujian3 = false;
              break;
            case 4:
              ujian4 = false;
              break;
            case 5:
              ujian5 = false;
              break;
            case 6:
              ujian6 = false;
              break;
            case 7:
              ujian7 = false;
              break;
            case 8:
              ujian8 = false;
              break;
            case 9:
              ujian9 = false;
              break;
            case 10:
              ujian10 = false;
              break;
          }
        }
      }
      showSuccessDialogWidget();
      // showWrongAnswerDialog(); // Tampilkan dialog jawaban salah
    }
  }

  void resetGame() {
    setState(() {
      selectedImage = null;
      showSuccessDialog = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cari Bentuk Gambar yang Sama',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/background5.png",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Image.asset(
                      targetImage,
                      height: 150.0,
                    ),
                    const SizedBox(height: 20.0),
                    Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      children: options.map((option) {
                        return buildShapeOption(option['path']!);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildShapeOption(String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = imagePath;
        });
        checkAnswer();
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: selectedImage == imagePath ? Colors.blueAccent : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            height: 70.0,
          ),
        ),
      ),
    );
  }

  void showSuccessDialogWidget() {
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
                'Soal Selanjutnya!',
                style: TextStyle(
                    fontSize: 26,
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
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'ok',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void showWrongAnswerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Ups!',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Jawaban Anda salah. Coba lagi!',
            style: TextStyle(fontSize: 18.0),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
