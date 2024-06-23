import 'package:flutter/material.dart';
import 'package:genmmas/games/cari_gambar_screen.dart';
import 'package:genmmas/games/cari_gambar_tersembunyi_screen.dart';
import 'package:genmmas/games/cocokkan_gambar_screen.dart';
import 'package:genmmas/games/cocokkan_text_screen.dart';
import 'package:genmmas/games/lengkapi_kata_screen.dart';
import 'package:genmmas/games/maze_screen.dart';
import 'package:genmmas/games/pasangkan_gambar_screen.dart';
import 'package:genmmas/games/susun_kata_screen.dart';
import 'package:genmmas/games/tebak_gambar_screen.dart';
import 'package:genmmas/games/voice_game_screen.dart';
import 'package:genmmas/models/hiddem_item.dart';
import 'package:genmmas/userPorfile.dart';
import 'package:page_transition/page_transition.dart';

class ListSoalScreen extends StatefulWidget {
  const ListSoalScreen({super.key});

  @override
  _ListSoalScreenState createState() => _ListSoalScreenState();
}

class _ListSoalScreenState extends State<ListSoalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Soal'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          CustomButton(
            iconPath: 'assets/icon.gif',
            label: 'Pasangkan Gambar',
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  duration: const Duration(milliseconds: 300),
                  type: PageTransitionType.rightToLeft,
                  child: const SingleImageMatchingGameScreen(),
                ),
              );
            },
          ),
          CustomButton(
            iconPath: 'assets/icon.gif',
            label: 'Cari Gambar',
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  duration: const Duration(milliseconds: 300),
                  type: PageTransitionType.rightToLeft,
                  child: const CariGambarScreen(),
                ),
              );
            },
          ),
          CustomButton(
            iconPath: 'assets/icon.gif',
            label: 'Cocokan Gambar',
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  duration: const Duration(milliseconds: 300),
                  type: PageTransitionType.rightToLeft,
                  child: const ImageMatchingGameScreen(),
                ),
              );
            },
          ),
          CustomButton(
            iconPath: 'assets/icon.gif',
            label: 'Cocokan Text',
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  duration: const Duration(milliseconds: 300),
                  type: PageTransitionType.rightToLeft,
                  child: const TextMatchingGameScreen(),
                ),
              );
            },
          ),
          CustomButton(
            iconPath: 'assets/icon.gif',
            label: 'Lengkapi Kata',
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  duration: const Duration(milliseconds: 300),
                  type: PageTransitionType.rightToLeft,
                  child: const LengkapiKataScreen(),
                ),
              );
            },
          ),
          CustomButton(
            iconPath: 'assets/icon.gif',
            label: 'Susun Kata',
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  duration: const Duration(milliseconds: 300),
                  type: PageTransitionType.rightToLeft,
                  child: const SusunKataScreen(),
                ),
              );
            },
          ),
          CustomButton(
            iconPath: 'assets/icon.gif',
            label: 'Tebak Gambar',
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  duration: const Duration(milliseconds: 300),
                  type: PageTransitionType.rightToLeft,
                  child: const TebakGambarScreen(),
                ),
              );
            },
          ),
          CustomButton(
            iconPath: 'assets/icon.gif',
            label: 'Maze',
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  duration: const Duration(milliseconds: 300),
                  type: PageTransitionType.rightToLeft,
                  child: const MazeScreen(),
                ),
              );
            },
          ),
          CustomButton(
            iconPath: 'assets/icon.gif',
            label: 'Gambar Tersembunyi',
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  duration: const Duration(milliseconds: 300),
                  type: PageTransitionType.rightToLeft,
                  child: const HiddenObjectGameScreen(),
                ),
              );
            },
          ),
          CustomButton(
            iconPath: 'assets/icon.gif',
            label: 'Voice Game',
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  duration: const Duration(milliseconds: 300),
                  type: PageTransitionType.rightToLeft,
                  child: const VoiceGameScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
