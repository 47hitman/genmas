import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../services/globals.dart';

class MatchingGameScreenAssestment extends StatefulWidget {
  const MatchingGameScreenAssestment({super.key});

  @override
  _MatchingGameScreenAssestmentState createState() =>
      _MatchingGameScreenAssestmentState();
}

class _MatchingGameScreenAssestmentState
    extends State<MatchingGameScreenAssestment> {
  @override
  void initState() {
    super.initState();
    // print("--------------");
    // print(targetImage);
    // _play();
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
      showSuccessDialogWidget();
      showSuccessDialog = true;
      // showWrongAnswerDialog(); // Tampilkan dialog jawaban salah
    }
  }

  void resetGame() {
    setState(() {
      selectedImage = null;
      showSuccessDialog = false;
    });
  }

  void playSound() async {
    _play();
  }

  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();

  void _play() {
    _player.open(
      Audio.network(
        soundAsesmen, // Ganti dengan URL audio dari internet
      ),
      autoStart: true,
      showNotification: true,
    );
  }

  @override
  void dispose() {
    _player.dispose(); // Dispose the player when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mencocokkan Gambar',
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
                    IconButton(
                      icon: const Icon(Icons.volume_up,
                          size: 50, color: Colors.blue),
                      onPressed: playSound,
                    ),
                    const SizedBox(height: 40),
                    Image.network(
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
          child: Image.network(
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
