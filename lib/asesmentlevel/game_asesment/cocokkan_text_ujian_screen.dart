// ignore_for_file: library_private_types_in_public_api

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../../menu/level_1_menu.dart';
import '../../services/globals.dart';

class TextMatchingGameUjianScreen extends StatefulWidget {
  const TextMatchingGameUjianScreen({super.key});

  @override
  _TextMatchingGameUjianScreenState createState() =>
      _TextMatchingGameUjianScreenState();
}

class _TextMatchingGameUjianScreenState
    extends State<TextMatchingGameUjianScreen> {
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

  void _showSuccessDialog() {
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

  bool _checkIfMatched(String draggedItem, String targetItem) {
    return draggedItem == targetItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'cocokkan kata yang sama',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background 6.png"),
            fit: BoxFit.cover,
          ),
        ),
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
                        // ignore: deprecated_member_use
                        onWillAccept: (data) => true,
                        // ignore: deprecated_member_use
                        onAccept: (data) {
                          if (_checkIfMatched(data, item)) {
                            setState(() {
                              matchedItems.add(item);
                            });
                            _checkCompletion();
                            for (int i = 1; i <= 10; i++) {
                              if (ujian == i) {
                                switch (i) {
                                  case 1:
                                    ujian1 = true;
                                    soalujian1 = true;
                                    break;
                                  case 2:
                                    ujian2 = true;
                                    soalujian2 = true;
                                    break;
                                  case 3:
                                    ujian3 = true;
                                    soalujian3 = true;
                                    break;
                                  case 4:
                                    ujian4 = true;
                                    soalujian4 = true;
                                    break;
                                  case 5:
                                    ujian5 = true;
                                    soalujian5 = true;
                                    break;
                                  case 6:
                                    ujian6 = true;
                                    soalujian6 = true;
                                    break;
                                  case 7:
                                    ujian7 = true;
                                    soalujian7 = true;
                                    break;
                                  case 8:
                                    ujian8 = true;
                                    soalujian8 = true;
                                    break;
                                  case 9:
                                    ujian9 = true;
                                    soalujian9 = true;
                                    break;
                                  case 10:
                                    ujian10 = true;
                                    soalujian10 = true;
                                    break;
                                }
                              }
                            }
                          } else {
                            for (int i = 1; i <= 10; i++) {
                              if (ujian == i) {
                                switch (i) {
                                  case 1:
                                    ujian1 = false;
                                    soalujian1 = true;
                                    break;
                                  case 2:
                                    ujian2 = false;
                                    soalujian2 = true;
                                    break;
                                  case 3:
                                    ujian3 = false;
                                    soalujian3 = true;
                                    break;
                                  case 4:
                                    ujian4 = false;
                                    soalujian4 = true;
                                    break;
                                  case 5:
                                    ujian5 = false;
                                    soalujian5 = true;
                                    break;
                                  case 6:
                                    ujian6 = false;
                                    soalujian6 = true;
                                    break;
                                  case 7:
                                    ujian7 = false;
                                    soalujian7 = true;
                                    break;
                                  case 8:
                                    ujian8 = false;
                                    soalujian8 = true;
                                    break;
                                  case 9:
                                    ujian9 = false;
                                    soalujian9 = true;
                                    break;
                                  case 10:
                                    ujian10 = false;
                                    soalujian10 = true;
                                    break;
                                }
                              }
                            }
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
