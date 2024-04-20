import 'dart:math' show Random;

import 'package:flutter/material.dart';

// LINK - https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html

class AnimatedScreen extends StatefulWidget {

  // Para utilizar rutas con nombre de go-router
  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  double borderRadius = 10;
  Color color = Colors.indigo;

  void changeShape() {
    final random = Random();

    width = random.nextInt(300) + 120; // + 120 valor mínimo evita que sea 0
    height = random.nextInt(300) + 120; // + 120 valor mínimo evita que sea 0
    borderRadius = random.nextInt(100) + 20;
    color = Color.fromRGBO(
        random.nextInt(255), // red
        random.nextInt(255), // green
        random.nextInt(255), // blue
        1 // opacity
        );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),

      // EXAMPLE with animation

      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic, // Type Animation
          width: width <= 0 ? 0 : width, // Prevenir que sea menor a 0
          height: height <= 0 ? 0 : height, // Prevenir que sea menor a 0
          decoration: BoxDecoration(
              color: color,
              borderRadius:
                  BorderRadius.circular(borderRadius <= 0 ? 0 : borderRadius)),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
