import 'dart:math' show Random;
import 'package:flutter/material.dart';

import 'package:app_widgets/config/responsive_size.dart';

class AnimatedScreen extends StatefulWidget {

  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double alto  = 0.6;
  double ancho = 0.6;
  int alfa     = 200;
  int red      = 200;
  int green    = 200;
  int blue     = 200;

  void changeSize() {
    final random  = Random();
    alto  = (random.nextDouble() * 0.6) + 0.01;
    ancho = (random.nextDouble() * 0.6) + 0.01;
    alfa  = random.nextInt(156) + 100;
    red   = random.nextInt(206) + 50;
    green = random.nextInt(206) + 50;
    blue  = random.nextInt(206) + 50;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutCubic,
          height: sh(alto, context),
          width: sw(ancho, context),
          decoration: BoxDecoration(
            color:  Color.fromARGB(alfa, red, green, blue),
            borderRadius: BorderRadius.circular(sw(0.03, context))
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => changeSize(),
        child: const Text('Animar'),
      ),
    );
  }
}