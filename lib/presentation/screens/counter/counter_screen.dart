import 'package:flutter/material.dart';

// NOTE
/*
Ejemplo básico de una pantalla con 'scaffold'
que te permite tener elementos en toda la pantalla como head body and footer
*/
/* Ejemplo de uso para StatelessWidget que se cambio a un StatefulWidget
para el uso del estado del counter
*/

class CounterScreen extends StatefulWidget {
  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        centerTitle: true,
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
      floatingActionButton: FloatingActionButton(
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
    );
  }
}
