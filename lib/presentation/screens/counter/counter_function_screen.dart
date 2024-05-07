import 'package:flutter/material.dart';

// INFO DOUBTS
/*
Continued example of CounterScreen to implementation a AppBar with icons.
Custom widgets example to buttons of + and -
*/

class CounterFunctionScreen extends StatefulWidget {

  // Para utilizar rutas con nombre de go-router (no usar al tiempo que CounterScreen)
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

        // SECTION - Navbar

        appBar: AppBar(
          title: const Text('Counter Functions'),
          centerTitle: true,
          // Coloca un icono a la izquierda
          leading: IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),
          // Coloca un icono a la Derecha pero puede ser mas de 1
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

        // SECTION - Body

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

        // SECTION - Floating Buttons +1 -1 and reset

        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomFloatBtn(
                icon: Icons.refresh_outlined,
                onPressed: () {
                  // 1° forma de cambiar el estado
                  setState(() {
                    clickCounter = 0;
                  });
                }),
            const SizedBox(height: 10),
            CustomFloatBtn(
                icon: Icons.plus_one,
                onPressed: () {
                  // 2° forma de cambiar el estado
                  clickCounter++;
                  setState(() {});
                },
            ),
            const SizedBox(height: 10),
            CustomFloatBtn(
                icon: Icons.exposure_minus_1,
                onPressed: () {
                  if(clickCounter == 0) return;
                  clickCounter--;
                  setState(() {});
                },
            ),
          ],
        ));
  }
}

class CustomFloatBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomFloatBtn({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
