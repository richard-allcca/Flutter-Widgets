import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/provider/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {

    // Props for without Custom provider
    // final int selectedRadioColor = ref.watch(selectedColorProvider);
    // final isDarkMode = ref.watch(themeProvider);


    // Props for with Custom provider
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,

      // Method without Custom provider
      // theme: AppTheme(selectedColor: selectedRadioColor, isDarkMode: isDarkMode ).getTheme(),

      // Method with Custom provider
      theme: appTheme.getTheme(),

    );

    // NOTE - Example with named routes in home_screen

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: AppTheme(selectedColor: 4).getTheme(),
    //   home: const HomeScreen(),
    //   routes: {
    //     '/buttons':(context) =>  const ButtonScreen(),
    //     '/cards':(context) => const CardsScreen()
    //   },
    // );
  }
}
