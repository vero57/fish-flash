import 'package:flutter/material.dart';
import 'package:fish_flash/screen/gameplay/mudah/intermission.dart'; 
import 'package:fish_flash/screen/gameplay/mudah/memorize_screen.dart';

class MudahScreen extends StatelessWidget {
  const MudahScreen({super.key});

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