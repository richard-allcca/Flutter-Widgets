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
import 'package:provider/provider.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/screens/screens.dart';
import 'package:widgets_app/presentation/state-provider/chat_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yes or Not app',
        theme: AppTheme(isDarkMode: false, selectedColor: 6).getTheme(),
        home: const ChatScreen(),
      ),
    );
  }
}
