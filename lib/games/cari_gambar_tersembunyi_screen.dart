import 'package:flutter/material.dart';

import '../models/hiddem_item.dart';

class HiddenObjectGameScreen extends StatefulWidget {
  const HiddenObjectGameScreen({super.key});

  @override
  _HiddenObjectGameScreenState createState() => _HiddenObjectGameScreenState();
}

class _HiddenObjectGameScreenState extends State<HiddenObjectGameScreen> {
  List<HiddenItem> hiddenItems = [
    HiddenItem(imagePath: 'assets/icon.gif', position: const Offset(100, 200)),
    HiddenItem(imagePath: 'assets/icon.gif', position: const Offset(250, 350)),
    // Tambahkan lebih banyak item tersembunyi di sini
  ];

  Set<int> foundItems = {};

  void _checkForHiddenItem(Offset position) {
    for (int i = 0; i < hiddenItems.length; i++) {
      final item = hiddenItems[i];
      final itemRect = Rect.fromLTWH(
        item.position.dx,
        item.position.dy,
        50, // Assuming each item is 50x50 pixels
        50,
      );

      if (itemRect.contains(position)) {
        setState(() {
          foundItems.add(i);
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You found an item!')),
        );

        return;
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('No item found here, try again!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find the Hidden Objects'),
      ),
      body: GestureDetector(
        onTapDown: (details) {
          _checkForHiddenItem(details.localPosition);
        },
        child: Stack(
          children: [
            // Background image or any other background widget
            Positioned.fill(
              child: Image.asset(
                'assets/background.png',
                fit: BoxFit.cover,
              ),
            ),
            // Hidden items
            ...hiddenItems.asMap().entries.map((entry) {
              int index = entry.key;
              HiddenItem item = entry.value;

              return Positioned(
                left: item.position.dx,
                top: item.position.dy,
                child: foundItems.contains(index)
                    ? Image.asset(
                        item.imagePath,
                        width: 50,
                        height: 50,
                      )
                    : Container(
                        width: 50,
                        height: 50,
                        color: Colors.transparent,
                      ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
