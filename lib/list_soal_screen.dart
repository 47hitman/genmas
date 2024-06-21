import 'package:flutter/material.dart';
import 'package:genmmas/games/cari_gambar_screen.dart';
import 'package:genmmas/games/cari_gambar_tersembunyi_screen.dart';
import 'package:genmmas/games/cocokkan_gambar_screen.dart';
import 'package:genmmas/games/cocokkan_text_screen.dart';
import 'package:genmmas/games/lengkapi_kata_screen.dart';
import 'package:genmmas/games/maze_screen.dart';
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
      body: Column(children: [
        CustomButton(
          iconPath: 'assets/icon.gif',
          label: 'Cari Gambar',
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    duration: const Duration(milliseconds: 300),
                    type: PageTransitionType.rightToLeft,
                    child: const CariGambarScreen()));
            // Aksi untuk About Us
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
                    child: const CocokkanGambarScreen()));
            // Aksi untuk About Us
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
                    child: const CocokkanTextScreen()));
            // Aksi untuk About Us
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
                    child: const LengkapiKataScreen()));
            // Aksi untuk About Us
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
                    child: const SusunKataScreen()));
            // Aksi untuk About Us
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
                    child: const TebakGambarScreen()));
            // Aksi untuk About Us
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
                    child: const MazeScreen()));
            // Aksi untuk About Us
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
                    child: const HiddenObjectGameScreen()));
            // Aksi untuk About Us
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
                    child: const VoiceGameScreen()));
            // Aksi untuk About Us
          },
        ),
      ]),
    );
  }
}
