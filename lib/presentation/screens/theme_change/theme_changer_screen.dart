import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/provider/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  // Para utilizar rutas con nombre de go-router
  static const String name = 'Theme_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    // Method with provider mutable
    // final isDarkMode = ref.watch(themeProvider);

    // Method with provider custom
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme changer'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode == true
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onPressed: () {

              // Method with provider mutable
              // ref.read(themeProvider.notifier).update((state) => !state);

              // Method with provider custom
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {

    final List<Color> colors = ref.watch(colorListProvider);

    // Method with provider mutable
    // final int selectedRadioColor = ref.watch(selectedColorProvider);

    // Method with provider custom
    final int selectedRadioColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];

        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: selectedRadioColor,
          onChanged: (value) {

            // Method with provider mutable
            // ref.read(selectedColorProvider.notifier).state = index;

            // Method with provider mutable
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
        },);
      },
    );
  }
}
