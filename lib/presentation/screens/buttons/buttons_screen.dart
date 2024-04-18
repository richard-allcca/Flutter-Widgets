import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonScreen extends StatelessWidget {

  // Para utilizar rutas con nombre de go-router
  static const String name = 'buttons_screen';

  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: () {
          context.pop(); // Return to last page - example with go_route
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox( // Contenedor
      width: double.infinity,// Para ocupar todo el width del dispositivo (cuidado)
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [

            // Button normal
            ElevatedButton(onPressed: (){}, child: const Text('Elevated button')),

            // Button deactivated
            const ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),

            // Button with icon
            ElevatedButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated icon'),
            ),

            // Button with fill
            FilledButton(onPressed: (){}, child: const Text('Filled Button')),

            // Button with filled and icon
            FilledButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.access_alarm_outlined),
              label: const Text('Button filled and icon')
            ),

            // Buttons type outline
            OutlinedButton(onPressed: (){}, child: const Text('Outline button')),

            // Buttons type outline with icon
            OutlinedButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.access_time_filled_outlined),
              label: const Text('Button outline')
            ),

            // Text button
            TextButton(onPressed: (){}, child: const Text('Text button')),

            // Text button with icon
            TextButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.cabin_outlined),
              label: const Text('Text Button')
            ),

            // Icon button
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.app_registration_outlined),
                style: ButtonStyle(
                    iconColor: MaterialStatePropertyAll(colors.primary))
            ),

            // Icon button with background
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.dark_mode_outlined),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white)),
            ),

            // Custom button
            const CustomButton()
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ClipRRect( // Para hacer border radius al btn
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.inversePrimary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Custom button'),
          ),
        ),
      ),
    );
  }
}