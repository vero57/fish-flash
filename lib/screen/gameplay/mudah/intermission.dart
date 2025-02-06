import 'package:flutter/material.dart';

class IntermissionBefore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntermissionWidgetMemorize();
  }
}

// tampilan "sesi mengingat dimulai"
class IntermissionWidgetMemorize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/mengingat.png',
        width: 500, // Set the desired width
        height: 200, // Set the desired height
      ),
    );
  }
}

// tampilan "Waktu habis sesi pertanyaan dimulai"
class IntermissionWidgetQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/pertanyaan.png',
        width: 500, // Set the desired width
        height: 200, // Set the desired height
      ),
    );
  }
}