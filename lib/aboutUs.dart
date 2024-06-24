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
        'Our Mission',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      Text(
        'Our mission is to provide the best services to our customers and ensure customer satisfaction through continuous improvement and innovation.',
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 16),
      Text(
        'Our Vision',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      Text(
        'We envision a world where our solutions make life easier and more enjoyable for everyone.',
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 16),
      Text(
        'Our Team',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      Text(
        'Our team consists of dedicated professionals who are passionate about what they do. We work together to achieve our common goals and strive for excellence in every project we undertake.',
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 16),
      // Center(
      //   child: Column(
      //     children: [
      //       CircleAvatar(
      //         radius: 40,
      //         backgroundImage: AssetImage(
      //             'assets/team_member_1.png'), // Replace with your asset
      //       ),
      //       SizedBox(height: 8),
      //       Text(
      //         'John Doe',
      //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //       ),
      //       Text(
      //         'CEO',
      //         style: TextStyle(fontSize: 16, color: Colors.grey),
      //       ),
      //       SizedBox(height: 16),
      //       CircleAvatar(
      //         radius: 40,
      //         backgroundImage: AssetImage(
      //             'assets/team_member_2.png'), // Replace with your asset
      //       ),
      //       SizedBox(height: 8),
      //       Text(
      //         'Jane Smith',
      //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //       ),
      //       Text(
      //         'CTO',
      //         style: TextStyle(fontSize: 16, color: Colors.grey),
      //       ),
      //     ],
      //   ),
      // ),
      SizedBox(height: 16),
      Text(
        'Contact Us',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      Text(
        'If you have any questions or need further information, feel free to contact us at info@example.com.',
        style: TextStyle(fontSize: 16),
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
