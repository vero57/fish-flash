import 'package:flutter/material.dart';
import 'package:fish_flash/data/hewan_data.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:fish_flash/screen/lobby_screen.dart'; 
import 'package:fish_flash/screen/gameplay/sulit/sulit.dart';

class ResultPage extends StatelessWidget {
  final String hewanName;
  final int imageCount;
  final int userChoice;

  ResultPage({required this.hewanName, required this.imageCount, required this.userChoice});

  @override
  Widget build(BuildContext context) {
    final hewan = hewanFigures.firstWhere((element) => element['name'] == hewanName);
    final resultImagePath = hewan['result']!;
    final isCorrect = userChoice == imageCount;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  isCorrect ? 'assets/Benar.png' : 'assets/Salah.png',
                  width: 200,
                ),
                const SizedBox(height: 20),
                Container(
                  width: 600,
                  height: 410,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF4894F7),
                      width: 5,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 600,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              resultImagePath,
                              width: 500,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 100,
                        child: Center(
                          child: StrokeText(
                            text: '$imageCount',
                            textStyle: const TextStyle(
                              fontSize: 35,
                              fontFamily: 'Super Bubble',
                              color: Colors.white,
                            ),
                            strokeColor: const Color.fromARGB(255, 72, 148, 247),
                            strokeWidth: 10,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 600,
                        height: 100,
                        child: Center(
                          child: Image.asset(
                            'assets/result/kamumenjawab.png',
                            width: 420,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 100,
                        child: Center(
                          child: StrokeText(
                            text: '$userChoice',
                            textStyle: const TextStyle(
                              fontSize: 35,
                              fontFamily: 'Super Bubble',
                              color: Colors.white,
                            ),
                            strokeColor: isCorrect
                                ? const Color.fromARGB(255, 72, 148, 247)
                                : const Color.fromARGB(255, 255, 149, 149),
                            strokeWidth: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LobbyScreen()),
                        );
                      },
                      child: Image.asset(
                        'assets/kembali.png',
                        width: 250,
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SulitScreen()),
                        );
                      },
                      child: Image.asset(
                        'assets/mainlagi.png',
                        width: 250,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}