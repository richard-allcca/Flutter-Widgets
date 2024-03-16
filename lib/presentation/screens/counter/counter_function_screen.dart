import 'package:flutter/material.dart';

// NOTE
/*
Ejemplo continuado de counterScreen para implementar un AppBar con icons
*/
/*
Ejemplo Widgets personalizados para los botones de + y -
*/

class CounterFunctionScreen extends StatefulWidget {
  static const String name = 'counter_screen';

  const CounterFunctionScreen({super.key});

  @override
  State<CounterFunctionScreen> createState() => _CounterFunctionScreenState();
}

class _CounterFunctionScreenState extends State<CounterFunctionScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Functions'),
        centerTitle: true,
        // NOTE - ubica por default un icono a la izquierda
        leading: IconButton(
          icon: const Icon(Icons.refresh_outlined),
          onPressed: () {
            setState(() {
              clickCounter = 0;
            });
          },
        ),
        // NOTE - ubica por un icono a la Derecha pero puede recibir mas de 1
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter',
                style: const TextStyle(
                    fontSize: 160, fontWeight: FontWeight.w100)),
            Text('Click${clickCounter == 1 ? '' : 's'}',
                style: const TextStyle(fontSize: 25))
          ],
        ),
      ),
      floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                // 1° forma de cambiar el estado
                setState(() {
                  clickCounter++;
                });
                // 2° forma de cambiar el estado
                //   clickCounter++;
                // setState(() {});
              },
              child: const Icon(Icons.plus_one),
            ),
            const SizedBox(height: 10,),
            FloatingActionButton(
              onPressed: () {
                // 1° forma de cambiar el estado
                setState(() {
                  clickCounter--;
                });
                // 2° forma de cambiar el estado
                //   clickCounter++;
                // setState(() {});
              },
              child: const Icon(Icons.exposure_minus_1),
            ),
          ],
        )
    );
  }
}
