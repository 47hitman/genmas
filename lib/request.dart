import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class TeacherUploadScreen extends StatelessWidget {
  const TeacherUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Teacher Upload Screen',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: UploadForm(),
        ),
      ),
    );
  }
}

class UploadForm extends StatefulWidget {
  const UploadForm({super.key});

  @override
  _UploadFormState createState() => _UploadFormState();
}

class _UploadFormState extends State<UploadForm> {
  final List<String> games = [
    'Level 1',
    'Level 2',
    'Level 3',
    'Level 4',
    'Level 5'
  ];
  final List<String> activities = [
    'Aktivitas 1',
    'Aktivitas 2',
    'Aktivitas 3',
    'Aktivitas 4',
    'Aktivitas 5',
    'Aktivitas 6',
    'Aktivitas 7'
  ];

  String? selectedGame;
  String? selectedActivity;
  List<XFile>? _images = [];
  List<File>? _sounds = [];

  final ImagePicker _picker = ImagePicker();

  void _pickImages() async {
    final List<XFile> pickedImages = await _picker.pickMultiImage();
    if (pickedImages.length <= 3) {
      setState(() {
        _images = pickedImages;
      });
    } else if (pickedImages.length > 3) {
      // Handle the case where more than 3 images are picked
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You can only upload up to 3 images')),
      );
    }
  }

  void _pickSounds() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: true,
      withData: true,
    );

    if (result != null && result.files.length <= 2) {
      List<File> pickedSounds = [];
      for (var file in result.files) {
        if (file.size <= 1024 * 1024) {
          pickedSounds.add(File(file.path!));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Each sound file must be 1 MB or less')),
          );
        }
      }
      setState(() {
        _sounds = pickedSounds;
      });
    } else if (result != null && result.files.length > 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('You can only upload up to 2 sound files')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Pilih Level',
              border: OutlineInputBorder(),
            ),
            value: selectedGame,
            items: games.map((String game) {
              return DropdownMenuItem<String>(
                value: game,
                child: Text(game),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedGame = value;
              });
            },
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Pilih Aktivitas',
              border: OutlineInputBorder(),
            ),
            value: selectedActivity,
            items: activities.map((String activity) {
              return DropdownMenuItem<String>(
                value: activity,
                child: Text(activity),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedActivity = value;
              });
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _pickImages,
            icon: const Icon(
              Icons.upload_file,
              color: Colors.white,
            ),
            label: const Text(
              'Upload Gambar (Maks 3)',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
          const SizedBox(height: 16),
          _images!.isEmpty
              ? const Text('Belum ada gambar yang diunggah')
              : Column(
                  children: _images!.map((image) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Image.file(
                        File(image.path),
                        height: 100,
                      ),
                    );
                  }).toList(),
                ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _pickSounds,
            icon: const Icon(
              Icons.audiotrack,
              color: Colors.white,
            ),
            label: const Text(
              'Upload Suara (Maks 2, 1MB)',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
          const SizedBox(height: 16),
          _sounds!.isEmpty
              ? const Text('Belum ada suara yang diunggah')
              : Column(
                  children: _sounds!.map((sound) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: const Icon(Icons.audiotrack),
                        title: Text(sound.path.split('/').last),
                      ),
                    );
                  }).toList(),
                ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              // Handle the submit action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(vertical: 16),
              textStyle: const TextStyle(fontSize: 18),
            ),
            child: const Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
