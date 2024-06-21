import 'package:flutter/material.dart';
import 'package:maze/maze.dart';

class MazeScreen extends StatefulWidget {
  const MazeScreen({super.key});

  @override
  _MazeScreenState createState() => _MazeScreenState();
}

class _MazeScreenState extends State<MazeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maze Game'),
      ),
      body: SafeArea(
        child: Maze(
          player: MazeItem('assets/icon.gif', ImageType.asset),
          columns: 6,
          rows: 12,
          wallThickness: 4.0,
          wallColor: Theme.of(context).primaryColor,
          finish: MazeItem('assets/icon.gif', ImageType.asset),
          onFinish: () => print('Hi from finish line!'),
        ),
      ),
    );
  }
}
