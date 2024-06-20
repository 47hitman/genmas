import 'package:flutter/material.dart';
import '../models/match_item.dart';
import '../widget/line_painter.dart';

class CocokkanGambarScreen extends StatefulWidget {
  const CocokkanGambarScreen({super.key});

  @override
  _CocokkanGambarScreenState createState() => _CocokkanGambarScreenState();
}

class _CocokkanGambarScreenState extends State<CocokkanGambarScreen> {
  late List<MatchItem> _leftItems;
  late List<MatchItem> _rightItems;
  Offset? _startOffset;
  Offset? _endOffset;
  int _selectedIndex = -1;
  bool _isIncorrect = false;
  final GlobalKey _painterKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    _leftItems = [
      MatchItem(imagePath: 'assets/icon.gif'),
      MatchItem(imagePath: 'assets/icon.gif'),
    ];
    _rightItems = List.from(_leftItems);
    _rightItems.shuffle();
  }

  void _onLeftItemTap(int index, BuildContext context) {
    setState(() {
      _selectedIndex = index;
      RenderBox box = context.findRenderObject() as RenderBox;
      _startOffset = box.localToGlobal(Offset.zero) +
          Offset(box.size.width / 2, box.size.height / 2);
      _isIncorrect = false;
    });
  }

  void _onRightItemTap(int index, BuildContext context) {
    if (_selectedIndex != -1) {
      if (_leftItems[_selectedIndex].imagePath ==
          _rightItems[index].imagePath) {
        setState(() {
          RenderBox box = context.findRenderObject() as RenderBox;
          _endOffset = box.localToGlobal(Offset.zero) +
              Offset(box.size.width / 2, box.size.height / 2);

          _leftItems[_selectedIndex].isMatched = true;
          _rightItems[index].isMatched = true;

          _selectedIndex = -1;

          // Show notification
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Gambar cocok!'),
              duration: Duration(seconds: 2),
            ),
          );
        });
      } else {
        setState(() {
          _isIncorrect = true;
          _selectedIndex = -1;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cocokkan Gambar',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(_leftItems.length, (index) {
                      return GestureDetector(
                        onTap: () => _onLeftItemTap(index, context),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _leftItems[index].isMatched
                                  ? Colors.green
                                  : Colors.blue,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            _leftItems[index].imagePath,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(_rightItems.length, (index) {
                      return GestureDetector(
                        onTap: () => _onRightItemTap(index, context),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _rightItems[index].isMatched
                                  ? Colors.green
                                  : Colors.blue,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            _rightItems[index].imagePath,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          if (_startOffset != null && _endOffset != null)
            CustomPaint(
              key: _painterKey,
              size: Size.infinite,
              painter: LinePainter(start: _startOffset!, end: _endOffset!),
            ),
          if (_isIncorrect)
            Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Gambar tidak cocok, coba lagi!',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
