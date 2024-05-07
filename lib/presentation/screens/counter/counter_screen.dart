import 'package:flutter/material.dart';

// INFO - Counter con estado local sin management state
/*
Example basic of a screen with 'scaffold'
which allows you to have elements on the screen like head, body and footer.
Example of use with StatelessWidget that change to StatefulWidget for management the state
*/

class CounterScreen extends StatefulWidget {

  // Para utilizar rutas con nombre de go-router
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
        actions: [
          IconButton(
            icon: const Icon(Icons.light_mode_outlined),
            onPressed: (){},
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Alignment of the row
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
