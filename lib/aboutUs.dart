import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const children2 = <Widget>[
      Text(
        'Tentang Kami',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 16),
      Text(
        'Aplikasi ini dibuat untuk membantu meningkatkan kemampuan membaca permulaan peserta didik hambatan intelektual ringan.',
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 16),
      Text(
        'Ucapan Terima Kasih',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 8),
      Text(
        'Terima kasih sudah menggunakan aplikasi ini. Aplikasi ini masih ada banyak kekurangan dan sangat membutuhkan masukan serta perbaikan lebih lanjut.',
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang aplikasi'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: const SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children2,
          ),
        ),
      ),
    );
  }
}
