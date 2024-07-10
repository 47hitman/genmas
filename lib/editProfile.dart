import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();

  File? _image;
  String? _email;
  String? _firstName;
  String? _lastName;

  Future<void> _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Here, you can send the updated data to your backend server
      // print('Updated Info:');
      // print('Email: $_email');
      // print('First Name: $_firstName');
      // print('Last Name: $_lastName');
      if (_image != null) {
        // print('Profile Picture: ${_image!.path}');
      }
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
          children: [
            AppBar(
              title: const Text('edit profil'),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Form(
              key: _formKey,
              child: Expanded(
                child: ListView(
                  children: <Widget>[
                    GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: _image == null
                            ? const NetworkImage(
                                'https://gemmasapi.kapuyuaxdev.my.id/file/user/tessiswa.png')
                            : FileImage(_image!) as ImageProvider,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      initialValue: _email ?? '',
                      decoration: const InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      initialValue: _firstName ?? '',
                      decoration:
                          const InputDecoration(labelText: 'nama depan'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'masukan nama depan';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _firstName = value;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      initialValue: _lastName ?? '',
                      decoration:
                          const InputDecoration(labelText: 'nama belakang'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'masukan nama belakang';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _lastName = value;
                      },
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: _submit,
                      child: const Text('simpan perubahan'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
