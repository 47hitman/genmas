import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:maze/maze.dart' as maze; // Use 'maze' as a prefix

class MazeScreen extends StatefulWidget {
  const MazeScreen({Key? key}) : super(key: key);

  @override
  _MazeScreenState createState() => _MazeScreenState();
}

class _MazeScreenState extends State<MazeScreen> {
  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();
  @override
  void initState() {
    super.initState();
    _play();
  }

  void _play() {
    _player.open(
      Audio('assets/soal1/Level 1 (aktivitas 7a).m4a'),
      autoStart: true,
      showNotification: true,
    );
  }

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
          Expanded(
            child: SafeArea(
              child: maze.Maze(
                // Use 'maze.Maze' here
                player: maze.MazeItem(
                  // Use 'maze.MazeItem' here
                  'assets/level1/aktivitas7/andy.png',
                  maze.ImageType.asset, // Use 'maze.ImageType' with the prefix
                ),
                columns: 6,
                rows: 12,
                wallThickness: 4.0,
                wallColor: Colors.blueAccent,
                finish: maze.MazeItem(
                  // Use 'maze.MazeItem' here
                  'assets/level1/aktivitas7/rumah.png',
                  maze.ImageType.asset, // Use 'maze.ImageType' with the prefix
                ),
                onFinish: () {
                  showCompletionDialog(); // Call function to show dialog
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
                    .pop(); // Close dialog when OK button is pressed
              },
            ),
          ],
        );
      },
    );
  }
}
