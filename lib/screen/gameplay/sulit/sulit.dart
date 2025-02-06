import 'package:flutter/material.dart';
import 'package:fish_flash/screen/gameplay/sulit/intermission.dart'; 
import 'package:fish_flash/screen/gameplay/sulit/memorize_screen.dart';

class SulitScreen extends StatelessWidget {
  const SulitScreen({super.key});

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
        child: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return IntermissionWidgetMemorize(); 
            } else {
              return MemorizeWidget(); 
            }
          },
        ),
      ),
    );
  }
}