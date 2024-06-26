import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const children2 = <Widget>[
      Text(
        'About Us',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 16),
      Text(
        'Aplikasi ini dibuat untuk membantu meningkatkan kemampuan membaca permulaan peserta didik hambatan intelektual ringan.',
        style: TextStyle(fontSize: 18),
      ),
      SizedBox(height: 16),
      Text(
        'Ucapan Terima Kasih',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      Text(
        'Terima kasih sudah menggunakan aplikasi ini. Aplikasi ini masih ada banyak kekurangan dan sangat membutuhkan masukan serta perbaikan lebih lanjut.',
        style: TextStyle(fontSize: 18),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children2,
        ),
      ),
    );
  }
}
