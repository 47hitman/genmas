import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalPoints = 0;
  Map<int, int> levelPoints = {
    1: 0, // Example initial points for levels, replace with actual logic
    2: 0,
    3: 0,
    4: 0,
    5: 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: <Widget>[
                      Icon(
                        Icons.child_care,
                        size: 32,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Welcome!',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.star,
                        size: 24,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Points: $totalPoints',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                children: <Widget>[
                  Icon(
                    Icons.games,
                    size: 24,
                    color: Colors.black,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Games',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: List.generate(6, (index) {
                  if (index < 5) {
                    return GameCard(
                      label: 'Level ${index + 1}',
                      unlocked: index == 0 || levelPoints[index]! >= 80,
                      onTap: () {
                        if (index == 0 || levelPoints[index]! >= 80) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GameLevelScreen(
                                    level: index + 1,
                                    onPointsEarned: (points) {
                                      setState(() {
                                        levelPoints[index + 1] = points;
                                        totalPoints += points;
                                      });
                                    })),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Complete the previous levels to unlock this level')),
                          );
                        }
                      },
                    );
                  } else {
                    return GameCard(
                      label: 'Assessment',
                      unlocked: levelPoints[5]! >= 80,
                      onTap: () {
                        if (levelPoints[5]! >= 80) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AssessmentScreen()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Complete all levels to unlock the assessment')),
                          );
                        }
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  final String label;
  final bool unlocked;
  final VoidCallback onTap;

  const GameCard({
    super.key,
    required this.label,
    required this.unlocked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: unlocked ? onTap : null,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.videogame_asset,
                size: 40,
                color: unlocked ? Colors.blue : Colors.grey,
              ),
              const SizedBox(height: 16),
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: unlocked ? Colors.black : Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GameLevelScreen extends StatelessWidget {
  final int level;
  final Function(int) onPointsEarned;

  const GameLevelScreen(
      {super.key, required this.level, required this.onPointsEarned});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level $level'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Content for Level $level'),
            ElevatedButton(
              onPressed: () {
                // Simulate earning points
                onPointsEarned(80);
                Navigator.pop(context);
              },
              child: const Text('Complete Level'),
            ),
          ],
        ),
      ),
    );
  }
}

class AssessmentScreen extends StatelessWidget {
  const AssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assessment'),
      ),
      body: const Center(
        child: Text('Content for Assessment'),
      ),
    );
  }
}
