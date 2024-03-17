// SECTION - Counter basic and counter with state

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:widgets_app/presentation/screens/screens.dart';

// void main() {
//   runApp(
//     const ProviderScope(
//       child: MainApp()
//     )
//   );
// }

// class MainApp extends ConsumerWidget {
//   const MainApp({super.key});

//   // DESC - First screen of counter used theme of material 3
//   @override
//   Widget build(BuildContext context, ref) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         useMaterial3: true,
//         colorSchemeSeed: Colors.blue
//       ),
//       // home: const CounterScreen(),
//       home: const CounterFunctionScreen(),
//     );
//   }
// }

// SECTION - Application Yes or Not chat

import 'package:flutter/material.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yes or Not app',
      theme: AppTheme(isDarkMode: false, selectedColor: 2).getTheme(),
      home: const ChatScreen(),
    );
  }
}

  // @override
  // Widget build(BuildContext context, ref) {

    // Props for use without Custom provider
    // final int selectedRadioColor = ref.watch(selectedColorProvider);
    // final isDarkMode = ref.watch(themeProvider);


    // Props for use with Custom provider
    // final AppTheme appTheme = ref.watch(themeNotifierProvider);

    // return MaterialApp.router(
    //   title: 'Flutter Widgets',
    //   routerConfig: appRouter,
    //   debugShowCheckedModeBanner: false,

      // Method without Custom provider
      // theme: AppTheme(selectedColor: selectedRadioColor, isDarkMode: isDarkMode ).getTheme(),

      // Method with Custom provider
    //   theme: appTheme.getTheme(),

    // );

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
  // }
