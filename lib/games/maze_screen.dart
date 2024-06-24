import 'package:flutter/material.dart';
import 'package:maze/maze.dart';

class MazeScreen extends StatefulWidget {
  const MazeScreen({Key? key}) : super(key: key);

  @override
  _MazeScreenState createState() => _MazeScreenState();
}

class _MazeScreenState extends State<MazeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ayo temukan jalan',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 19, 212, 42),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Ayo temukan jalan Andi untuk pergi ke sekolah!',
              style: TextStyle(fontSize: 20, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: SafeArea(
              child: Maze(
                player: MazeItem(
                  'assets/level1/aktivitas7/andy.png',
                  ImageType.asset,
                ),
                columns: 6,
                rows: 12,
                wallThickness: 4.0,
                wallColor: Colors.blueAccent,
                finish: MazeItem(
                  'assets/level1/aktivitas7/rumah.png',
                  ImageType.asset,
                ),
                onFinish: () {
                  showCompletionDialog(); // Panggil fungsi untuk menampilkan dialog
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showCompletionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Selamat!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Anda telah membantu Andi menemukan jalannya ke sekolah!',
            style: TextStyle(fontSize: 18),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Tutup dialog saat tombol OK ditekan
              },
            ),
          ],
        );
      },
    );
  }
}
