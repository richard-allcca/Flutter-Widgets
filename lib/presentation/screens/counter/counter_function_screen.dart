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
