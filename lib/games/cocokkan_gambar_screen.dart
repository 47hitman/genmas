import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../menu/level_1_menu.dart';
import '../services/globals.dart';

class ImageMatchingGameScreen extends StatefulWidget {
  const ImageMatchingGameScreen({super.key});

  @override
  _ImageMatchingGameScreenState createState() =>
      _ImageMatchingGameScreenState();
}

class _ImageMatchingGameScreenState extends State<ImageMatchingGameScreen> {
  final List<Map<String, String>> shuffledItems = [];
  final Set<String> matchedItems = {};
  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();

  @override
  void initState() {
    super.initState();
    shuffledItems.addAll(items);
    shuffledItems.shuffle();
    _play();
  }

  //  aktivitas2 = 1;

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _play() {
    _player.open(
      Audio('assets/soal1/Level 1 (aktivitas 2a).m4a'),
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

  void _checkCompletion() {
    final List<String> compliments = [
      'assets/option/Bagus.m4a',
      'assets/option/Hebat.m4a',
      'assets/option/Pintar.m4a'
    ];
    if (matchedItems.length == items.length) {
      final randomCompliment =
          compliments[Random().nextInt(compliments.length)];
      _play2(randomCompliment);
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
  // void _showSuccessDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text(
  //           'Selamat!',
  //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //         ),
  //         content: const Text(
  //           'Kamu berhasil mencocokkan semua gambar!',
  //           style: TextStyle(fontSize: 20),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('OK'),
  //             onPressed: () {
  //               setState(() {
  //                 switch (aktivitas2) {
  //                   case 1:
  //                     aktivast21 = true;
  //                     break;
  //                   case 2:
  //                     aktivast22 = true;
  //                     break;
  //                   case 3:
  //                     aktivast23 = true;
  //                     break;
  //                   case 4:
  //                     aktivast24 = true;
  //                     break;
  //                   case 5:
  //                     aktivast25 = true;
  //                     break;
  //                   case 6:
  //                     aktivast26 = true;
  //                     break;
  //                   case 7:
  //                     aktivast27 = true;
  //                     break;
  //                   case 8:
  //                     aktivast28 = true;
  //                     break;
  //                   default:
  //                     print('Invalid aktivitas2 value: $aktivitas2');
  //                     break;
  //                 }
  //               });

  //               _saveData();
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (context) =>
  //                         const menu1level()), // Replace SpecificPage with your target page
  //               );
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  bool _checkIfMatched(String imagePath, String targetPath) {
    return imagePath == targetPath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cocokkan gambar yang sama',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
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
            //     'Seret dan lepaskan kartu ke pasangan yang sesuai',
            //     style: TextStyle(fontSize: 22, color: Colors.white),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: items.map((item) {
                      return Draggable<Map<String, String>>(
                        data: item,
                        feedback: Material(
                          child: Column(
                            children: [
                              item['image'] != null
                                  ? Image.asset(item['image']!,
                                      width: 70, height: 60)
                                  : Container(),
                              Text(
                                item['text']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        childWhenDragging: Container(
                          width: 70,
                          height: 70,
                          color: Colors.grey,
                        ),
                        child: matchedItems.contains(item['image'])
                            ? Container(
                                width: 70,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                ),
                                child: Column(
                                  children: [
                                    item['image'] != null
                                        ? Image.asset(item['image']!,
                                            width: 70, height: 60)
                                        : Container(),
                                    Text(
                                      item['text']!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                width: 70,
                                height: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                ),
                                child: Column(
                                  children: [
                                    item['image'] != null
                                        ? Image.asset(item['image']!,
                                            width: 70, height: 60)
                                        : Container(),
                                    Text(
                                      item['text']!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: shuffledItems.map((item) {
                      return DragTarget<Map<String, String>>(
                        builder: (BuildContext context,
                            List<Map<String, String>?> candidateData,
                            List<dynamic> rejectedData) {
                          return Container(
                            width: 70,
                            height: 90,
                            decoration: BoxDecoration(
                              color: matchedItems.contains(item['image'])
                                  ? Colors.green
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.white, width: 3),
                            ),
                            child: Column(
                              children: [
                                item['image'] != null
                                    ? Image.asset(item['image']!,
                                        width: 70, height: 60)
                                    : Container(),
                                Text(
                                  item['text']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        // ignore: deprecated_member_use
                        onWillAccept: (data) => true,
                        // ignore: deprecated_member_use
                        onAccept: (data) {
                          if (_checkIfMatched(data['image']!, item['image']!)) {
                            setState(() {
                              matchedItems.add(item['image']!);
                            });
                            final List<String> compliments = [
                              'assets/option/Bagus.m4a',
                              'assets/option/Hebat.m4a',
                              'assets/option/Pintar.m4a'
                            ];
                            final randomCompliment = compliments[
                                Random().nextInt(compliments.length)];
                            _play2(randomCompliment);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Cocok!')),
                            );
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
                  extra1 != '' || extra2 != '' || extra3 != '' || extra4 != ''
                      ? const SizedBox(
                          width: 50,
                        )
                      : Container(),
                  extra1 != '' || extra2 != '' || extra3 != '' || extra4 != ''
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (extra4 != '')
                              Draggable<Map<String, String>>(
                                data: {'image': extra4, 'text': extratext4},
                                feedback: Material(
                                  child: Column(
                                    children: [
                                      Image.asset(extra4,
                                          width: 70, height: 60),
                                      Text(
                                        extratext4,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                childWhenDragging: Container(
                                  width: 70,
                                  height: 70,
                                  color: Colors.grey,
                                ),
                                child: Container(
                                  width: 70,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(extra4,
                                          width: 70, height: 60),
                                      Text(
                                        extratext4,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (extra1 != '')
                              Draggable<Map<String, String>>(
                                data: {'image': extra1, 'text': extratext1},
                                feedback: Material(
                                  child: Column(
                                    children: [
                                      Image.asset(extra1,
                                          width: 70, height: 60),
                                      Text(
                                        extratext1,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                childWhenDragging: Container(
                                  width: 70,
                                  height: 70,
                                  color: Colors.grey,
                                ),
                                child: Container(
                                  width: 70,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(extra1,
                                          width: 70, height: 60),
                                      Text(
                                        extratext1,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (extra2 != '')
                              Draggable<Map<String, String>>(
                                data: {'image': extra2, 'text': extratext2},
                                feedback: Material(
                                  child: Column(
                                    children: [
                                      Image.asset(extra2,
                                          width: 70, height: 60),
                                      Text(
                                        extratext2,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                childWhenDragging: Container(
                                  width: 70,
                                  height: 70,
                                  color: Colors.grey,
                                ),
                                child: Container(
                                  width: 70,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(extra2,
                                          width: 70, height: 60),
                                      Text(
                                        extratext2,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (extra3 != '')
                              Draggable<Map<String, String>>(
                                data: {'image': extra3, 'text': extratext3},
                                feedback: Material(
                                  child: Column(
                                    children: [
                                      Image.asset(extra3,
                                          width: 70, height: 60),
                                      Text(
                                        extratext3,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                childWhenDragging: Container(
                                  width: 70,
                                  height: 70,
                                  color: Colors.grey,
                                ),
                                child: Container(
                                  width: 70,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(extra3,
                                          width: 70, height: 60),
                                      Text(
                                        extratext3,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
