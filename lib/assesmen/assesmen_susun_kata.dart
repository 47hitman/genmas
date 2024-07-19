import 'dart:async';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../services/globals.dart';

class SusunKataScreenAsesmen extends StatefulWidget {
  const SusunKataScreenAsesmen({super.key});

  @override
  _SusunKataScreenAsesmenState createState() => _SusunKataScreenAsesmenState();
}

class _SusunKataScreenAsesmenState extends State<SusunKataScreenAsesmen> {
  String selectedOption = assetName;
  @override
  void initState() {
    super.initState();
  }

  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();
  void _play(sound) {
    _player.open(
      Audio.network(
        sound, // Ganti dengan URL audio dari internet
      ),
      autoStart: true,
      showNotification: true,
    );
  }

  void _playKataBerurutan() {
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

  void playSound() async {
    _play(levelSoundAsesmen);
  }

  void playSound2() async {
    _play(soundAsesmen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alfabet Lenkap',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 19, 212, 42),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background4.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                IconButton(
                  icon:
                      const Icon(Icons.volume_up, size: 50, color: Colors.blue),
                  onPressed: playSound2,
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  targetImage,
                  width: 70,
                  height: 70,
                ),
                // const SizedBox(height: 20),
                // Kolom kosong untuk jawaban
                // Gambar
                IconButton(
                  icon:
                      const Icon(Icons.volume_up, size: 50, color: Colors.blue),
                  onPressed: playSound,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(answer.length, (index) {
                        return Container(
                          width: 50,
                          height: 50,
                          // margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              answer[index],
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                // Pilihan suku kata
                Wrap(
                  alignment: WrapAlignment.center,
                  children: optionsAsesmen.map((option) {
                    return GestureDetector(
                      onTap: () {
                        // playAudioForCharacter(option);
                        updateAnswer(option);
                      },
                      child: Container(
                        width: 70,
                        height: 70,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.yellow[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            option,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void updateAnswer(String selectedOption) {
    setState(() {
      bool answerUpdated = false;
      for (int i = 0; i < answer.length; i++) {
        if (answer[i] == "") {
          answer[i] = selectedOption;
          answerUpdated = true;
          break;
        }
      }
      if (!answer.contains("") && answerUpdated) {
        checkAnswer();
      }
    });
  }

  int incorrectAttempts = 0; // Initialize the counter

  void checkAnswer() {
    if (answer[0] == correctAnswerAsesmen[0] &&
        answer[1] == correctAnswerAsesmen[1]) {
      _playKataBerurutan();
      // incorrectAttempts = 0; // Reset the counter on correct answer
    } else {
      _playKataBerurutan();
      // incorrectAttempts++; // Increment the counter on incorrect answer
    }
  }
}
