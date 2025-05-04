import 'package:fish_flash/screen/gameplay/mudah/mudah.dart';
import 'package:fish_flash/screen/gameplay/sulit/sulit.dart';
import 'package:flutter/material.dart';
import 'tutorial.dart';

class DifficultyScreen extends StatelessWidget {
  const DifficultyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MudahScreen()),
                    );
                    },
                    child: SizedBox(
                      height: 400.0,
                      width: 400.0,
                      child: Center(
                        child: Image.asset('assets/mudah.png'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SulitScreen()),
                    );
                    },
                    child: SizedBox(
                      height: 400.0,
                      width: 400.0,
                      child: Center(
                        child: Image.asset('assets/sulit.png'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TutorialScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 72, 148, 247),
                  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                ),
                child: const Text(
                  'CARA BERMAIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'Super Bubble'
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}