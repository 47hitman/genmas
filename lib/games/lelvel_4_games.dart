import 'dart:async';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../menu/level_4_menu.dart';
import '../services/globals.dart';

class SusunKataScreenLevel4 extends StatefulWidget {
  const SusunKataScreenLevel4({super.key});

  @override
  _SusunKataScreenLevel4State createState() => _SusunKataScreenLevel4State();
}

class _SusunKataScreenLevel4State extends State<SusunKataScreenLevel4> {
  String selectedOption = assetName;
  @override
  void initState() {
    super.initState();
    _play('assets/level4/Level 4.m4a');
    Future.delayed(const Duration(seconds: 6), () {
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

  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    switch (aktivitas2) {
      case 1:
        prefs.setBool('level41', level41);
        break;
      case 2:
        prefs.setBool('level42', level42);
        break;
      case 3:
        prefs.setBool('level43', level43);
        break;
      case 4:
        prefs.setBool('level44', level44);
        break;
      case 5:
        prefs.setBool('level45', level45);
        break;
      case 6:
        prefs.setBool('level46', level46);
        break;
      case 7:
        prefs.setBool('level47', level47);
        break;
      case 8:
        prefs.setBool('level48', level48);
        break;
      case 9:
        prefs.setBool('level49', level49);
        break;
      case 10:
        prefs.setBool('level40', level40);
        break;

      default:
        // print('Invalid aktivitas2 value: $aktivitas2');
        break;
    }
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
    int index = 0;
    final List<String> compliments = [
      'assets/option/Bagus.m4a',
      'assets/option/Hebat.m4a',
      'assets/option/Pintar.m4a'
    ];

    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (index < correctAnswer.length) {
        playAudioForCharacter(correctAnswer[index]);
        index++;
      } else {
        String selectedOption = assetName;

        if (selectedOption == 'susu') {
          _play('assets/level3/Level 3 susu.m4a');
        } else if (selectedOption == 'sawi') {
          _play('assets/level3/Level 3 sawi.m4a');
        } else if (selectedOption == 'sapu') {
          _play('assets/level3/Level 3 sapu.m4a');
        } else if (selectedOption == 'siku') {
          _play('assets/level3/Level 3 siku.m4a');
        } else if (selectedOption == 'soda') {
          _play('assets/level3/Level 3 soda.m4a');
        } else if (selectedOption == 'bibir') {
          _play('assets/level3/Level 3 bibir.m4a');
        } else if (selectedOption == 'badak') {
          _play('assets/level3/Level 3 badak.m4a');
        } else if (selectedOption == 'botol') {
          _play('assets/level3/Level 3 botol.m4a');
        } else if (selectedOption == 'bayam') {
          _play('assets/level3/Level 3 bayam.m4a');
        } else if (selectedOption == 'beras') {
          _play('assets/level3/Level 3 beras.m4a');
        }
        // Pilih satu pujian secara acak
        setState(() {
          switch (aktivitas2) {
            case 1:
              level41 = true;
              break;
            case 2:
              level42 = true;
              break;
            case 3:
              level43 = true;
              break;
            case 4:
              level44 = true;
              break;
            case 5:
              level45 = true;
              break;
            case 6:
              level46 = true;
              break;
            case 7:
              level47 = true;
              break;
            case 8:
              level48 = true;
              break;
            case 9:
              level49 = true;
              break;
            case 10:
              level40 = true;
              break;
            default:
              // print('Invalid aktivitas2 value: $aktivitas2');
              break;
          }
        });
        _saveData();
        // Tampilkan dialog setelah pujian dimainkan
        Future.delayed(const Duration(seconds: 2), () {
          final randomCompliment =
              compliments[Random().nextInt(compliments.length)];
          _play(randomCompliment);
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const menu4level()), // Replace SpecificPage with your target page
                        );
                        // _playKataBerurutan(); // Jika ingin memulai kembali setelah scoring, uncomment line ini
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

          // showDialog(
          //   context: context,
          //   builder: (context) => AlertDialog(
          //     title: const Text("Benar!"),
          //     content: const Text("Selamat, jawaban kamu benar!"),
          //     actions: [
          //       TextButton(
          //         onPressed: () {
          //           Navigator.of(context).pop();
          //           Navigator.of(context).pop();
          //         },
          //         child: const Text("OK"),
          //       ),
          //     ],
          //   ),
          // );
        });

        timer.cancel();
      }
    });
  }

  void playSound() async {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Susun Kata Level 4',
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              targetImage,
              width: 70,
              height: 70,
            ),
            // const SizedBox(height: 20),
            // Kolom kosong untuk jawaban
            // Gambar
            IconButton(
              icon: const Icon(Icons.volume_up, size: 50, color: Colors.blue),
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
              children: options4.map((option) {
                return GestureDetector(
                  onTap: () {
                    playAudioForCharacter(option);
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
    if (answer[0] == correctAnswer[0] && answer[1] == correctAnswer[1]) {
      _playKataBerurutan();
      incorrectAttempts = 0; // Reset the counter on correct answer
    } else {
      incorrectAttempts++; // Increment the counter on incorrect answer

      if (incorrectAttempts > 3) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Bantuan"),
            content: SizedBox(
              width: 20.0, // Sesuaikan lebar dialog sesuai kebutuhan Anda
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.pink.shade100,
                  border: Border.all(
                    color: Colors.pink.shade100, // Warna border pink muda
                  ),
                ),
                padding: const EdgeInsets.all(8.0), // Padding di dalam border
                child: Text(
                  selectedOption,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    answer = List.filled(answer.length, "");
                    incorrectAttempts =
                        0; // Reset the counter after showing the hint
                  });
                },
                child: const Text("OK"),
              ),
            ],
          ),
        );
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          _play('assets/option/Ayo coba lagi.m4a');
        });
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Salah"),
            content: const Text("Coba lagi, ya!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    answer = List.filled(answer.length, "");
                  });
                },
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    }
  }

  void playAudioForCharacter(String character) {
    // Define a map that maps each character to its corresponding audio file path
    Map<String, String> audioPaths = {
      'ba': 'assets/level4/Level 4 ba.m4a',
      'be': 'assets/level4/Level 4 be.m4a',
      'bi': 'assets/level4/Level 4 bi.m4a',
      'bir': 'assets/level4/Level 4 bir.m4a',
      'bo': 'assets/level4/Level 4 bo.m4a',
      'da': 'assets/level4/Level 4 da.m4a',
      'dak': 'assets/level4/Level 4 dak.m4a',
      'ku': 'assets/level4/Level 4 ku.m4a',
      'pu': 'assets/level4/Level 4 pu.m4a',
      'ras': 'assets/level4/Level 4 ras.m4a',
      'sa': 'assets/level4/Level 4 sa.m4a',
      'si': 'assets/level4/Level 4 si.m4a',
      'so': 'assets/level4/Level 4 so.m4a',
      'su': 'assets/level4/Level 4 su.m4a',
      'tol': 'assets/level4/Level 4 tol.m4a',
      'wi': 'assets/level4/Level 4 wi.m4a',
      'yam': 'assets/level4/Level 4 yam.m4a',
    };

    // Check if the character exists in the map
    if (audioPaths.containsKey(character)) {
      _play(audioPaths[
          character]); // Replace `_play` with your actual audio playing function
    } else {
      // Handle cases where character is not 'a' to 'z'
      print('No audio file found for character $character');
    }
  }
}
