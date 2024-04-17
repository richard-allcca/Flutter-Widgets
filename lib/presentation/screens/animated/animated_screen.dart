import 'dart:math' show Random;

import 'package:flutter/material.dart';

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
  Color color = Colors.indigo;
  double borderRadius = 10;

  void changeShape() {
    final random = Random();

    width = random.nextInt(300) + 120; // + 50 evita que sea 0
    height = random.nextInt(300) + 120; // + 50 evita que sea 0
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
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
              color: color,
              borderRadius:
                  BorderRadius.circular(borderRadius <= 0 ? 0 : borderRadius)),
        ),
      ),

      // EXAMPLE without animation

      // body: Center(
      //   child: Container(
      //     width: 100,
      //     height: 100,
      //     decoration: BoxDecoration(
      //       color: Colors.blue,
      //       borderRadius: BorderRadius.circular(20)
      //     ),
      //   ),
      // ),

      floatingActionButton: FloatingActionButton(
        // onPressed: () => changeShape(), // con argumentos
        onPressed: changeShape, // sin argumentos
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
