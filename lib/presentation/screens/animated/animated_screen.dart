import 'dart:math' show Random;

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;

  double height = 50;

  Color color = Colors.indigoAccent;

  double borderRadius = 10.0;

  void changeShape() {
    setState(() {
      final random = Random();

      width = random.nextInt(300) + 120;

      height = random.nextInt(300) + 120;

      color = Color.fromRGBO(
          random.nextInt(255), // Red
          random.nextInt(255), // Green
          random.nextInt(255), // Blue
          1//random.nextDouble() + 0.5 // Opacity
          );

      borderRadius = random.nextInt(100) + 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.elasticOut, // Tipo de animacion
          width: width <= 0 ? 0 : width, // evitar que por la animacion de un valor negativo
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius <= 0 ? 0 : borderRadius),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_sharp),
      ),
    );
  }
}
