import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:genmmas/assesmen/assesmen.dart';
import 'package:page_transition/page_transition.dart';

import 'games_screen.dart';
import 'services/globals.dart';
import 'services/services.dart';
import 'vidio/vidioScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = "Loading...";
  String role = "";

  @override
  void initState() {
    super.initState();
    _doSomething();
    _play();
  }

  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();
  void _play() {
    _player.stop().then((_) {
      _player.open(
        Audio('assets/intro.mp3'),
        autoStart: true,
        showNotification: true,
        loopMode: LoopMode.single, // Loop the audio
      );
    });
  }

  @override
  void dispose() {
    _player.dispose(); // Dispose the player when done
    super.dispose();
  }

  int points = 0; // Example points value
  void _doSomething() async {
    try {
      Map<String, dynamic>? value = await Services.instance.userInfo();
      if (value != null) {
        setState(() {
          print(value);
          name = "${value['first_name']} ${value['last_name']}";
          role = value['role'];
          points = value['score'];
          point = value['score'];
          print(point);
        });
      } else {
        _showErrorDialog('Error', 'Sedang Ada Gannguan Mohon Coba lagi');
      }
    } catch (e) {
      print('--------------');
      print('Error: $e');
      _showErrorDialog(
          'Error', 'An error occurred while fetching user information.');
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevents dialog from being dismissed by tapping outside
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async =>
              false, // Prevents dialog from being dismissed by the back button
          child: AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _onGamesTap() {
    role != ""
        ? setState(() {
            _player.dispose();
            isAudioPlayerReady = false;
            Navigator.push(
              context,
              PageTransition(
                duration: const Duration(milliseconds: 300),
                type: PageTransitionType.rightToLeft,
                child: const GamesScreen(),
              ),
            );
          })
        : _showErrorDialog('Error', 'Sedang Ada Gannguan Mohon Coba lagi');
  }

  void _onAssessmentTap() {
    setState(() {
      _player.dispose();
      isAudioPlayerReady = false;
      Navigator.push(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 300),
          type: PageTransitionType.rightToLeft,
          child: const assesmen(),
        ),
      );
    });
    // Aksi saat tombol ASESMEN ditekan
    // print('ASESMEN ditekan');
  }

  void _onHelpTap() {
    setState(() {
      _player.dispose();
      isAudioPlayerReady = false;
      Navigator.push(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 300),
          type: PageTransitionType.rightToLeft,
          child: const WebViewPage(),
        ),
      );
    });
    // Aksi saat tombol ASESMEN ditekan
    // print('ASESMEN ditekan');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display points, name, and role
                  Row(
                    children: [
                      Image.asset(
                        'assets/poin.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Poin: $points',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        'assets/simbolsiswa.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Nama: $name',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        'assets/peran.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Peran: $role',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: GestureDetector(
                onTap: _onGamesTap,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.videogame_asset,
                        size: 100,
                        color: Colors.purple,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Permainan",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: GestureDetector(
                onTap: _onAssessmentTap,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.school,
                        size: 100,
                        color: Colors.orange,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Assesmen",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: GestureDetector(
                onTap:
                    _onHelpTap, // Rename _onAssessmentTap to _onHelpTap if it's intended for Help
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.help,
                        size: 60,
                        color: Colors.red,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Petunjuk Penggunaan",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
