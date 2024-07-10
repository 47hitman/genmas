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
        backgroundColor: Colors.orange,
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

  // void showCompletionDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text(
  //           'Selamat!',
  //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //         ),
  //         content: const Text(
  //           'Anda telah membantu Andi menemukan jalannya ke sekolah!',
  //           style: TextStyle(fontSize: 18),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('OK'),
  //             onPressed: () {
  //               Navigator.of(context)
  //                   .pop(); // Close dialog when OK button is pressed
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
