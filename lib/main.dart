import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 1).getTheme(),
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
