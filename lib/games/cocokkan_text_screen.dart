import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../menu/level_1_menu.dart';
import '../services/globals.dart';

class TextMatchingGameScreen extends StatefulWidget {
  const TextMatchingGameScreen({super.key});

  @override
  _TextMatchingGameScreenState createState() => _TextMatchingGameScreenState();
}

class _TextMatchingGameScreenState extends State<TextMatchingGameScreen> {
  final List<String> shuffledItems = [];
  final Set<String> matchedItems = {};
  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();

  @override
  void initState() {
    super.initState();
    shuffledItems.addAll(itemstext);
    shuffledItems.shuffle();
    _play();
  }

  void _play2(sound) {
    _player.open(
      Audio(sound),
      autoStart: true,
      showNotification: true,
    );
  }

  void _play() {
    _player.open(
      Audio('assets/soal1/Level 1 (aktivitas 2c).m4a'),
      autoStart: true,
      showNotification: true,
    );
  }

  void _checkCompletion() {
    if (matchedItems.length == itemstext.length) {
      _showSuccessDialog();
    }
  }

  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    switch (aktivitas2) {
      case 1:
        prefs.setBool('aktivast21', aktivast21);
        break;
      case 2:
        prefs.setBool('aktivast22', aktivast22);
        break;
      case 3:
        prefs.setBool('aktivast23', aktivast23);
        break;
      case 4:
        prefs.setBool('aktivast24', aktivast24);
        break;
      case 5:
        prefs.setBool('aktivast25', aktivast25);
        break;
      case 6:
        prefs.setBool('aktivast26', aktivast26);
        break;
      case 7:
        prefs.setBool('aktivast27', aktivast27);
        break;
      case 8:
        prefs.setBool('aktivast28', aktivast28);
        break;
      default:
        // print('Invalid aktivitas2 value: $aktivitas2');
        break;
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Selamat!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Kamu berhasil mencocokkan semua teks!',
            style: TextStyle(fontSize: 20),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                setState(() {
                  switch (aktivitas2) {
                    case 1:
                      aktivast21 = true;
                      break;
                    case 2:
                      aktivast22 = true;
                      break;
                    case 3:
                      aktivast23 = true;
                      break;
                    case 4:
                      aktivast24 = true;
                      break;
                    case 5:
                      aktivast25 = true;
                      break;
                    case 6:
                      aktivast26 = true;
                      break;
                    case 7:
                      aktivast27 = true;
                      break;
                    case 8:
                      aktivast28 = true;
                      break;
                    default:
                      print('Invalid aktivitas2 value: $aktivitas2');
                      break;
                  }
                });

                _saveData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const menu1level()), // Replace SpecificPage with your target page
                );
              },
            ),
          ],
        );
      },
    );
  }

  bool _checkIfMatched(String draggedItem, String targetItem) {
    return draggedItem == targetItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cocokkan Teks!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Column(
          children: [
            // const Padding(
            //   padding: EdgeInsets.all(16.0),
            //   child: Text(
            //     'Seret dan lepaskan teks ke pasangan yang sesuai',
            //     style: TextStyle(fontSize: 22, color: Colors.white),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...itemstext.map((item) {
                        return Draggable<String>(
                          data: item,
                          feedback: Material(
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          childWhenDragging: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: matchedItems.contains(item)
                              ? Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                  ),
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                  ),
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                        );
                      }).toList(),
                      // Add extra texts as draggable items
                      ...extraTexts.map((extraText) {
                        return Draggable<String>(
                          data: extraText,
                          feedback: Material(
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.red, width: 2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                extraText,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          childWhenDragging: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              extraText,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: Text(
                              extraText,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: shuffledItems.map((item) {
                      return DragTarget<String>(
                        builder: (BuildContext context,
                            List<String?> candidateData,
                            List<dynamic> rejectedData) {
                          return Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: matchedItems.contains(item)
                                  ? Colors.green
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          );
                        },
                        onWillAccept: (data) => true,
                        onAccept: (data) {
                          if (_checkIfMatched(data, item)) {
                            setState(() {
                              matchedItems.add(item);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Cocok!')),
                            );
                            final List<String> compliments = [
                              'assets/option/Bagus.m4a',
                              'assets/option/Hebat.m4a',
                              'assets/option/Pintar.m4a'
                            ];
                            final randomCompliment = compliments[
                                Random().nextInt(compliments.length)];
                            _play2(randomCompliment);
                            _checkCompletion();
                          } else {
                            _play2('assets/option/Ayo coba lagi.m4a');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Tidak cocok, coba lagi!')),
                            );
                          }
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
