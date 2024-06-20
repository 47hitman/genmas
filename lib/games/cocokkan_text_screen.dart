import 'package:flutter/material.dart';

import '../models/match_text.dart';

class CocokkanTextScreen extends StatefulWidget {
  const CocokkanTextScreen({Key? key}) : super(key: key);

  @override
  _CocokkanTextScreenState createState() => _CocokkanTextScreenState();
}

class _CocokkanTextScreenState extends State<CocokkanTextScreen> {
  late List<MatchText> _leftTexts;
  late List<MatchText> _rightTexts;
  MatchText? _selectedLeftText;
  MatchText? _selectedRightText;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    _leftTexts = [
      MatchText(text: 'Apple'),
      MatchText(text: 'Banana'),
      MatchText(text: 'Orange'),
    ];
    _rightTexts = [
      MatchText(text: 'Banana'),
      MatchText(text: 'Orange'),
      MatchText(text: 'Apple'),
    ];
    _rightTexts.shuffle();
  }

  void _onLeftTextTap(MatchText text) {
    setState(() {
      if (_selectedLeftText == text) {
        _selectedLeftText = null;
      } else {
        _selectedLeftText = text;
      }
      _checkMatch();
    });
  }

  void _onRightTextTap(MatchText text) {
    setState(() {
      if (_selectedRightText == text) {
        _selectedRightText = null;
      } else {
        _selectedRightText = text;
      }
      _checkMatch();
    });
  }

  void _checkMatch() {
    if (_selectedLeftText != null && _selectedRightText != null) {
      if (_selectedLeftText!.text == _selectedRightText!.text) {
        // Match found
        setState(() {
          _selectedLeftText!.isMatched = true;
          _selectedRightText!.isMatched = true;
          _selectedLeftText = null;
          _selectedRightText = null;
        });

        // Show notification
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Teks cocok!'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        // No match, reset selection after a short delay
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            _selectedLeftText = null;
            _selectedRightText = null;
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cocokkan Teks',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(_leftTexts.length, (index) {
                  return GestureDetector(
                    onTap: () => _onLeftTextTap(_leftTexts[index]),
                    child: MatchTextWidget(
                      text: _leftTexts[index],
                      isSelected: _selectedLeftText == _leftTexts[index],
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(_rightTexts.length, (index) {
                  return GestureDetector(
                    onTap: () => _onRightTextTap(_rightTexts[index]),
                    child: MatchTextWidget(
                      text: _rightTexts[index],
                      isSelected: _selectedRightText == _rightTexts[index],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MatchTextWidget extends StatelessWidget {
  final MatchText text;
  final bool isSelected;

  const MatchTextWidget({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: text.isMatched
              ? Colors.green
              : isSelected
                  ? Colors.blue
                  : Colors.transparent,
          width: isSelected ? 4 : 0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      child: Text(
        text.text,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
