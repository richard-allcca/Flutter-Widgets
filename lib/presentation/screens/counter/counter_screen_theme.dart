import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/provider/counter_provider.dart';
import 'package:widgets_app/presentation/provider/theme_provider.dart';

// INFO - Counter with theme provider - management state
/*
Example basic of a screen with 'scaffold'
which allows you to have elements on the screen like head, body and footer.
Example of use with StatelessWidget that change to StatefulWidget for management the state
*/

class CounterScreenThemeProv extends ConsumerWidget {

  // Para utilizar rutas con nombre de go-router
  static const String name = 'counter_screen_theme_prov';

  const CounterScreenThemeProv({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: isDarkMode
              ? const Icon(Icons.dark_mode_outlined)
              : const Icon(Icons.light_mode_outlined),
            onPressed: (){
              // Method 1 - Manipular el estado del provider
              ref.read(isDarkModeProvider.notifier).update((state) => !state) ;
            },
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
        child: const Icon(Icons.plus_one),
        onPressed: () {

          // Method 1 - Manipular el estado del provider
          // ref.read(counterProvider.notifier).update((state) => state + 1);

          // Method 2 - Manipular el estado del provider
          ref.read(counterProvider.notifier).state++;
        },
      ),
    );
  }
}
