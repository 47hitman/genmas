// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:genmmas/editProfile.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'aboutUs.dart';
import 'gurus_screen.dart';
import 'loginScreens.dart';
import 'services/services.dart';

String name = "Loading...";
String email = "";
String role = "";

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    _doSomething();
  }

  int points = 0; // Example points value
  void _doSomething() async {
    try {
      Map<String, dynamic>? value = await Services.instance.userInfo();
      if (value != null) {
        setState(() {
          print(value);
          name = "${value['first_name']} ${value['last_name']}";
          email = value['email'];
          role = value['role'];
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background2.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Text(
                  'profile',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                // const CircleAvatar(
                //   radius: 30,
                //   backgroundImage: NetworkImage(
                //       'https://gemmasapi.kapuyuaxdev.my.id/file/user/tessiswa.png'), // Ganti dengan URL foto profil Anda
                // ),
                const CircleAvatar(
                    radius: 30,
                    // backgroundImage: NetworkImage(
                    //   'https://gemmasapi.kapuyuaxdev.my.id/file/user/tessiswa.png',
                    // ),
                    child: Icon(
                      Icons
                          .account_circle, // Ganti dengan ikon default yang Anda inginkan
                      size: 60, // Ukuran ikon
                      color: Colors.grey, // Warna ikon
                    )),

                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      email,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            CustomButton(
              iconPath: 'assets/simbolsiswa.png',
              label: 'edit profil',
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
            role != "Siswa"
                ? CustomButton(
                    iconPath: 'assets/simbolsiswa.png',
                    label: 'menu guru',
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              duration: const Duration(milliseconds: 300),
                              type: PageTransitionType.rightToLeft,
                              child: const DownloadScreen()));

                      // Aksi untuk Edit Profile
                    },
                  )
                : Container(),
            CustomButton(
              iconPath: 'assets/simbolsiswa.png',
              label: 'tentang aplikasi',
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const AboutUsScreen()));
                // Aksi untuk About Us
              },
            ),
            CustomButton(
              iconPath: 'assets/simbolsiswa.png',
              label: 'keluar',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.orange.shade100,
                      title: const Row(
                        children: [
                          // Icon(Icons.warning, color: Colors.red),
                          // SizedBox(width: 10),
                          Text(
                            'Konfirmasi Keluar',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      content: const Text(
                        'Apakah Anda Yakin Ingin Keluar?',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
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
                            },
                            child: const Text(
                              'Batal',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                          child: TextButton(
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
                            child: const Text(
                              'Keluar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
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
