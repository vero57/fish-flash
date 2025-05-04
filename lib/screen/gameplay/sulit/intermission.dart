import 'package:flutter/material.dart';

class IntermissionBefore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntermissionWidgetMemorize();
  }
}

class IntermissionWidgetMemorize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/mengingat.png',
        width: 500,
        height: 200,
      ),
    );
  }
}

class IntermissionWidgetQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/pertanyaan.png',
        width: 500,
        height: 200,
      ),
    );
  }
}