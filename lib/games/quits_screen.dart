import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

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
  // String targetImage = 'assets/level1/aktivitas6/kubus.png';
  // List<Map<String, String>> options = [
  //   {
  //     'image': 'dadu',
  //     'path': 'assets/level1/aktivitas6/dadu.png',
  //   },
  //   {
  //     'image': 'bola',
  //     'path': 'assets/level1/aktivitas6/bola.png',
  //   },
  //   {
  //     'image': 'gelas',
  //     'path': 'assets/level1/aktivitas6/gelas.png',
  //   },
  // ];
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
        title: const Text('Ayo Temukan Bentuk yang Sama!'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Pilih gambar di bawah yang memiliki bentuk yang mirip dengan kubus:',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ),
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
          title: const Text(
            'Selamat!',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Anda berhasil menemukan bentuk yang mirip ',
            style: TextStyle(fontSize: 18.0),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
              child: const Text('OK'),
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
