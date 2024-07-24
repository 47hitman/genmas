import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../../services/globals.dart';

class LengkapiKataUjianScreen extends StatefulWidget {
  const LengkapiKataUjianScreen({super.key});

  @override
  _LengkapiKataUjianScreenState createState() =>
      _LengkapiKataUjianScreenState();
}

class _LengkapiKataUjianScreenState extends State<LengkapiKataUjianScreen> {
  String selectedOption = assetName;
  @override
  void initState() {
    super.initState();
  }

  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();
  void _play(sound) {
    _player.open(
      Audio(sound),
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
    // _play(levelSoundAsesmen);
    Future.delayed(const Duration(seconds: 2), () {
      if (selectedOption == 'susu') {
        _play('assets/level3/Level 3 susu.m4a');
      }
      if (selectedOption == 'sawi') {
        _play('assets/level3/Level 3 sawi.m4a');
      }
      if (selectedOption == 'sapu') {
        _play('assets/level3/Level 3 sapu.m4a');
      }

      if (selectedOption == 'siku') {
        _play('assets/level3/Level 3 siku.m4a');
      }

      if (selectedOption == 'soda') {
        _play('assets/level3/Level 3 soda.m4a');
      }
      if (selectedOption == 'bibir') {
        _play('assets/level3/Level 3 bibir.m4a');
      }
      if (selectedOption == 'badak') {
        _play('assets/level3/Level 3 badak.m4a');
      }
      if (selectedOption == 'botol') {
        _play('assets/level3/Level 3 botol.m4a');
      }
      if (selectedOption == 'bayam') {
        _play('assets/level3/Level 3 bayam.m4a');
      }
      if (selectedOption == 'beras') {
        _play('assets/level3/Level 3 beras.m4a');
      }
    });
  }

  void playSound2() async {
    // _play(soundAsesmen);
    _play('assets/level3/insruksi.m4a');
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
          // mainAxisAlignment: MainAxisAlignment.center,
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
                Image.asset(
                  assetLocation,
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
      for (int i = 1; i <= 10; i++) {
        if (ujian == i) {
          switch (i) {
            case 1:
              ujian1 = true;
              break;
            case 2:
              ujian2 = true;
              break;
            case 3:
              ujian3 = true;
              break;
            case 4:
              ujian4 = true;
              break;
            case 5:
              ujian5 = true;
              break;
            case 6:
              ujian6 = true;
              break;
            case 7:
              ujian7 = true;
              break;
            case 8:
              ujian8 = true;
              break;
            case 9:
              ujian9 = true;
              break;
            case 10:
              ujian10 = true;
              break;
          }
        }
      }
      // print("benar");
      // incorrectAttempts = 0; // Reset the counter on correct answer
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
      // _playKataBerurutan();
      // incorrectAttempts++; // Increment the counter on incorrect answer
    }
  }
}
