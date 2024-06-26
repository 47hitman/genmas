// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:genmmas/services/globals.dart';

import '../services/services.dart';

class LengkapiKataScreen extends StatefulWidget {
  const LengkapiKataScreen({Key? key}) : super(key: key);

  @override
  _LengkapiKataScreenState createState() => _LengkapiKataScreenState();
}

class _LengkapiKataScreenState extends State<LengkapiKataScreen> {
  late String kataTersusun;
  late List<String> kataAcak;
  List<bool> sudahDipilih = [];
  int _countdown = 4;
  Timer? _countdownTimer;

  int incorrectAnswers = 0;
  bool showHelp = false;
  int points = 10; // Start with max points
  bool gameCompleted = false;
  void _pilihHuruf(int index) {
    setState(() {
      int nextIndex = sudahDipilih.indexWhere((e) => !e);
      if (nextIndex != -1 && kataAcak[index] == kataTersusun[nextIndex]) {
        sudahDipilih[nextIndex] = true;

        // Reset incorrect answers count
        incorrectAnswers = 0;

        // Check if all letters have been correctly chosen
        if (_cekPenyelesaian()) {
          // _showDialogKataBerhasilDisusun();
          _playKataBerurutan();
        }
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          _play('assets/option/Ayo coba lagi.m4a');
        });
        _showSnackBar('Pilih huruf berikutnya yang benar');
        incorrectAnswers++;

        if (incorrectAnswers >= 3 && !showHelp) {
          showHelp = true;
          _showHelpMenu();
        }

        // Adjust points based on incorrect answers and help usage
        if (showHelp) {
          points = 5;
        } else if (incorrectAnswers >= 3) {
          points = 0;
        }
      }
    });
  }

  void _showHelpMenu() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Bantuan'),
          content: Text('Silakan pilih huruf yang benar $kataTersusun'),
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
  void initState() {
    super.initState();
    String selectedOption = assetName;
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
    if (timer != false) {
      _startCountdown();
    }

    // Dummy data untuk contoh
    kataTersusun = assetName;
    kataAcak = _acakHuruf(kataTersusun);
    sudahDipilih = List<bool>.filled(kataTersusun.length, false);
    sudahDipilih[0] = pilih1;
    sudahDipilih[1] = pilih2;
    sudahDipilih[2] = pilih3;
    sudahDipilih[3] = pilih4;
  }

  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();
  void _play(sound) {
    _player.open(
      Audio(sound),
      autoStart: true,
      showNotification: true,
    );
  }

  void _startCountdown() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 1) {
        setState(() {
          _countdown--;
        });
      } else {
        setState(() {
          _countdown = 0;
        });
        _countdownTimer?.cancel();
      }
    });
  }

  List<String> _acakHuruf(String kata) {
    List<String> hurufAcak = kata.split('');
    int n = hurufAcak.length;

    bool isSamePosition;
    do {
      isSamePosition = false;

      // Fisher-Yates shuffle
      for (int i = n - 1; i > 0; i--) {
        int j = Random().nextInt(i + 1);
        // Swap elements at i and j
        String temp = hurufAcak[i];
        hurufAcak[i] = hurufAcak[j];
        hurufAcak[j] = temp;
      }

      // Check if any character is in its original position
      for (int i = 0; i < n; i++) {
        if (hurufAcak[i] == kata[i]) {
          isSamePosition = true;
          break;
        }
      }
    } while (isSamePosition);

    return hurufAcak;
  }

  bool _cekPenyelesaian() {
    return sudahDipilih.every((element) => element);
  }

  // void _reset() {
  //   setState(() {
  //     ScaffoldMessenger.of(context).removeCurrentSnackBar();
  //     kataAcak = _acakHuruf(kataTersusun);
  //     sudahDipilih = List<bool>.filled(kataTersusun.length, false);
  //     incorrectAnswers = 0;
  //     points = 10;
  //     showHelp = false;
  //     gameCompleted = false;
  //   });
  // }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _showDialogKataBerhasilDisusun() {
    if (!gameCompleted) {
      gameCompleted = true;
      // Calculate points
      if (showHelp) {
        points = 5;
      } else if (incorrectAnswers >= 3) {
        points = 0;
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Selamat!'),
            content: Text('Kata berhasil disusun!\nPoin: $points'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () async {
                  Navigator.of(context).pop(); // Tutup dialog
                  Navigator.of(context).pop(); // Kembali ke layar sebelumnya
                  await Services.instance.score(points);

                  // _playKataBerurutan(); // Jika ingin memulai kembali setelah scoring, uncomment line ini
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _playKataBerurutan() {
    int index = 0;
    final List<String> compliments = [
      'assets/option/Bagus.m4a',
      'assets/option/Hebat.m4a',
      'assets/option/Pintar.m4a'
    ];

    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (index < kataTersusun.length) {
        playAudioForCharacter(kataTersusun[index]);
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

        // Tampilkan dialog setelah pujian dimainkan
        Future.delayed(const Duration(seconds: 2), () {
          final randomCompliment =
              compliments[Random().nextInt(compliments.length)];
          _play(randomCompliment);
          _showDialogKataBerhasilDisusun();
        });

        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menyusun Huruf Menjadi Kata'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   'Poin: $points',
            //   style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            // ),
            if (timer != false)
              if (_countdown > 0)
                Text(
                  'Tunggu $_countdown detik...',
                  style: const TextStyle(fontSize: 24, color: Colors.red),
                ),
            // Ganti dengan gambar yang relevan
            assetLocation != null
                ? Image.asset(assetLocation, width: 100, height: 80)
                : Container(),
            if (timer != false)
              if (_countdown > 0)
                Text(
                  kataTersusun,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),

            const SizedBox(height: 16),

            // Kolom huruf acak

            // Kolom untuk menyusun kata

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                kataTersusun.length,
                (index) {
                  return timer != false
                      ? _countdown == 0
                          ? GestureDetector(
                              onTap: sudahDipilih[index]
                                  ? null
                                  : () {
                                      _pilihHuruf(index);
                                    },
                              child: Container(
                                width: 40,
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  sudahDipilih[index]
                                      ? kataTersusun[index]
                                      : '',
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ),
                            )
                          : Container() // Placeholder when countdown is not zero
                      : GestureDetector(
                          onTap: sudahDipilih[index]
                              ? null
                              : () {
                                  _pilihHuruf(index);
                                },
                          child: Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              sudahDipilih[index] ? kataTersusun[index] : '',
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        );
                },
              ),
            ),

            const SizedBox(height: 16),
            timer != false
                ? _countdown == 0
                    ? Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: List.generate(kataAcak.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              // print(kataAcak[index]); // Print the tapped character
                              playAudioForCharacter(kataAcak[
                                  index]); // Play audio for the tapped character
                              _pilihHuruf(
                                  index); // Call your _pilihHuruf function
                            },
                            child: Chip(
                              backgroundColor: Colors.grey,
                              label: Text(
                                kataAcak[index],
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          );
                        }),
                      )
                    : Container()
                : Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: List.generate(kataAcak.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          // print(kataAcak[index]); // Print the tapped character
                          playAudioForCharacter(kataAcak[
                              index]); // Play audio for the tapped character
                          _pilihHuruf(index); // Call your _pilihHuruf function
                        },
                        child: Chip(
                          backgroundColor: Colors.grey,
                          label: Text(
                            kataAcak[index],
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                    }),
                  ),
            const SizedBox(height: 16),

            // ElevatedButton(
            //   onPressed: _reset,
            //   child: const Text('Reset'),
            // ),
          ],
        ),
      ),
    );
  }

  void playAudioForCharacter(String character) {
    // Define a map that maps each character to its corresponding audio file path
    Map<String, String> audioPaths = {
      'a': 'assets/level3/Level 3 a.m4a',
      'b': 'assets/level3/Level 3 b.m4a',
      'c': 'assets/level3/Level 3 c.m4a',
      'd': 'assets/level3/Level 3 d.m4a',
      'e': 'assets/level3/Level 3 e.m4a',
      'f': 'assets/level3/Level 3 f.m4a',
      'g': 'assets/level3/Level 3 g.m4a',
      'h': 'assets/level3/Level 3 h.m4a',
      'i': 'assets/level3/Level 3 i.m4a',
      'j': 'assets/level3/Level 3 j.m4a',
      'k': 'assets/level3/Level 3 k.m4a',
      'l': 'assets/level3/Level 3 l.m4a',
      'm': 'assets/level3/Level 3 m.m4a',
      'n': 'assets/level3/Level 3 n.m4a',
      'o': 'assets/level3/Level 3 o.m4a',
      'p': 'assets/level3/Level 3 p.m4a',
      'q': 'assets/level3/Level 3 q.m4a',
      'r': 'assets/level3/Level 3 r.m4a',
      's': 'assets/level3/Level 3 s.m4a',
      't': 'assets/level3/Level 3 t.m4a',
      'u': 'assets/level3/Level 3 u.m4a',
      'v': 'assets/level3/Level 3 v.m4a',
      'w': 'assets/level3/Level 3 w.m4a',
      'x': 'assets/level3/Level 3 x.m4a',
      'y': 'assets/level3/Level 3 y.m4a',
      'z': 'assets/level3/Level 3 z.m4a',
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
