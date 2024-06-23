import 'package:flutter/material.dart';

class ImageMatchingGameScreen extends StatefulWidget {
  const ImageMatchingGameScreen({super.key});

  @override
  _ImageMatchingGameScreenState createState() =>
      _ImageMatchingGameScreenState();
}

class _ImageMatchingGameScreenState extends State<ImageMatchingGameScreen> {
  final List<Map<String, String>> items = [
    {'image': 'assets/soal1/ular.png', 'text': 'Ular'},
    {'image': 'assets/soal1/tupai.png', 'text': 'Tupai'},
    {'image': 'assets/soal1/kelinci.png', 'text': 'Kelinci'},
    {'image': 'assets/soal1/kupukupu.png', 'text': 'Kupu2'},
    {'image': 'assets/soal1/burung.png', 'text': 'Burung'},
  ];

  final List<Map<String, String>> shuffledItems = [];
  final Set<String> matchedItems = {};

  @override
  void initState() {
    super.initState();
    shuffledItems.addAll(items);
    shuffledItems.shuffle();
  }

  void _checkCompletion() {
    if (matchedItems.length == items.length) {
      _showSuccessDialog();
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
            'Kamu berhasil mencocokkan semua gambar!',
            style: TextStyle(fontSize: 20),
          ),
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

  bool _checkIfMatched(String imagePath, String targetPath) {
    return imagePath == targetPath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cocokkan Kartu',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Seret dan lepaskan kartu ke pasangan yang sesuai',
                style: TextStyle(fontSize: 22, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        onWillAccept: (data) => true,
                        onAccept: (data) {
                          if (_checkIfMatched(data['image']!, item['image']!)) {
                            setState(() {
                              matchedItems.add(item['image']!);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Cocok!')),
                            );
                            _checkCompletion();
                          } else {
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
