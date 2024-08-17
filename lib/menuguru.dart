import 'package:flutter/material.dart';
import 'package:genmmas/gurus_screen.dart';
import 'package:genmmas/request.dart';
import 'package:page_transition/page_transition.dart';

class TeacherMenuScreen extends StatelessWidget {
  const TeacherMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Guru'),
        // backgroundColor: Colors.blueAccent,
        elevation: 4.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              iconPath: 'assets/revisi/Icon menu guru.png',
              label: 'Request Soal',
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    duration: const Duration(milliseconds: 300),
                    type: PageTransitionType.rightToLeft,
                    child: const DownloadScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20.0), // Add spacing between buttons
            CustomButton(
              iconPath: 'assets/revisi/Icon menu guru.png',
              label: 'Download Nilai',
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    duration: const Duration(milliseconds: 300),
                    type: PageTransitionType.rightToLeft,
                    child: const TeacherUploadScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  const CustomButton({
    Key? key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 40.0,
              height: 40.0,
            ),
            const SizedBox(width: 15.0),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
