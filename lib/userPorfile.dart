// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:genmmas/editProfile.dart';
import 'package:genmmas/games/cocokkan_gambar_screen.dart';
import 'package:genmmas/games/cocokkan_text_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginScreens.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://gemmasapi.kapuyuaxdev.my.id/file/user/tessiswa.png'), // Ganti dengan URL foto profil Anda
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Nama Pengguna',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'email@example.com',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            CustomButton(
              iconPath: 'assets/icon.gif',
              label: 'Edit Profile',
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const EditProfileScreen()));

                // Aksi untuk Edit Profile
              },
            ),
            CustomButton(
              iconPath: 'assets/icon.gif',
              label: 'About Us',
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
              label: 'Logout',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Row(
                        children: [
                          Icon(Icons.warning, color: Colors.red),
                          SizedBox(width: 10),
                          Text('Confirm Logout')
                        ],
                      ),
                      content: const Text('Are you sure you want to logout?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            // Aksi untuk Logout
                            Navigator.of(context).pop();

                            // Clear the token from shared preferences
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.remove('auth_token');

                            // Navigate to the LoginScreen
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const LoginScreen()),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    );
                  },
                );
              },
              color: Colors.red,
            )
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
  final Color color;

  const CustomButton({
    super.key,
    required this.iconPath,
    required this.label,
    required this.onTap,
    this.color = const Color(0xFF01579B), // Default color
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 1,
              ),
              child: ListTile(
                leading: Image.asset(
                  iconPath,
                  width: 25,
                ),
                title: Transform.translate(
                  offset: const Offset(-10, 0),
                  child: Text(
                    label,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                trailing: IconButton(
                  onPressed: onTap,
                  icon: const Icon(Icons.chevron_right_rounded),
                  color: color,
                ),
              ),
            ),
          ),
        ),
        const Divider(
          indent: 20,
          endIndent: 20,
          thickness: 0.3,
        ),
      ],
    );
  }
}
