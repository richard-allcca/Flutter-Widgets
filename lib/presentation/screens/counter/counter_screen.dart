import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/provider/counter_provider.dart';
import 'package:widgets_app/presentation/provider/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Consumo del provider
    final int clickCounterProvider = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
              onPressed: () {
                ref
                    .read(themeProvider.notifier)
                    .update((state) => !state);
              },
              icon: isDarkMode
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined))
        ],
      ),
      body: Center(
        child: Text('Valor: $clickCounterProvider',
            style: Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Example 1 to modifier the state
          ref.read(counterProvider.notifier).state++;

          // Example 2 to modifier the state
          // ref.read(counterProvider.notifier)
          //   .update((state) => state + 1);
        },
      ),
    );
  }
}
