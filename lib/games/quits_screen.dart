import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../menu/level_1_menu.dart';
import '../services/globals.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MatchingGameScreen(),
    );
  }
}

class MatchingGameScreen extends StatefulWidget {
  const MatchingGameScreen({super.key});

  @override
  _MatchingGameScreenState createState() => _MatchingGameScreenState();
}

class _MatchingGameScreenState extends State<MatchingGameScreen> {
  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    switch (aktivitas6) {
      case 1:
        prefs.setBool('aktivast61', aktivast61);
        break;
      case 2:
        prefs.setBool('aktivast62', aktivast62);
        break;
      case 3:
        prefs.setBool('aktivast63', aktivast63);
        break;
      default:
        // print('Invalid aktivitas2 value: $aktivitas2');
        break;
    }
  }

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

  String? selectedImage;
  bool showSuccessDialog = false;

  void checkAnswer() {
    // Cek apakah gambar yang dipilih memiliki bentuk yang mirip dengan kubus (seperti dadu)
    if (selectedImage == options[0]['path']) {
      setState(() {
        showSuccessDialogWidget();
        showSuccessDialog = true;
      });
    } else {
      showWrongAnswerDialog(); // Tampilkan dialog jawaban salah
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
          SingleChildScrollView(
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
                onPressed: () {
                  setState(() {
                    switch (aktivitas6) {
                      case 1:
                        aktivast61 = true;
                        break;
                      case 2:
                        aktivast62 = true;
                        break;
                      case 3:
                        aktivast63 = true;
                        break;

                      default:
                        break;
                    }
                  });
                  resetGame();
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
          ],
        );
      },
    );
  }

  // void showSuccessDialogWidget() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text(
  //           'Selamat!',
  //           style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
  //         ),
  //         content: const Text(
  //           'Anda berhasil menemukan bentuk yang mirip ',
  //           style: TextStyle(fontSize: 18.0),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               setState(() {
  //                 switch (aktivitas6) {
  //                   case 1:
  //                     aktivast61 = true;
  //                     break;
  //                   case 2:
  //                     aktivast62 = true;
  //                     break;
  //                   case 3:
  //                     aktivast63 = true;
  //                     break;

  //                   default:
  //                     break;
  //                 }
  //               });
  //               resetGame();
  //               _saveData();
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (context) =>
  //                         const menu1level()), // Replace SpecificPage with your target page
  //               );
  //             },
  //             child: const Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

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
