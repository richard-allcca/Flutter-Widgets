// SECTION - Counter basic and counter with state

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:widgets_app/presentation/screens/screens.dart';

// void main() {
//   runApp( const MainApp() );
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
//       home: const CounterScreen(),
//       // home: const CounterFunctionScreen(),
//     );
//   }
// }

// SECTION - Application Yes or Not chat

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:widgets_app/config/theme/app_theme.dart';
// import 'package:widgets_app/presentation/screens/screens.dart';
// import 'package:widgets_app/presentation/state-provider/chat_provider.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => ChatProvider())
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Yes or Not app',
//         theme: AppTheme(isDarkMode: false, selectedColor: 6).getTheme(),
//         home: const ChatScreen(),
//       ),
//     );
//   }
// }

// SECTION - TOK TIK

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:widgets_app/config/theme/app_theme.dart';
// import 'package:widgets_app/infrastructure/datasources/local_videos_datasource_impl.dart';
// import 'package:widgets_app/infrastructure/repositories/videos_posts_repository_impl.dart';
// import 'package:widgets_app/presentation/provider/discover_provider.dart';
// import 'package:widgets_app/presentation/screens/screens.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {

//     // INFO - RepositoryImpl recibe la fuente de datos localVideosDatasourceImpl
//     final localVideosListRepository = VideosPostRepositoryImpl(
//       videosDatasource: LocalVideosDataSourceImpl()
//     );

//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//             create: (_) =>
//                 DiscoverProvider(videoRepository: localVideosListRepository)
//                 // Este '..' es un operador de cascada para seguido ejecutar otro método
//                   ..loadNextVideo()
//             )
//       ],
//       child: MaterialApp(
//         title: 'Tok Tik',
//         debugShowCheckedModeBanner: false,
//         theme: AppTheme(isDarkMode: true, selectedColor: 4).getTheme(),
//         home: const DiscoverScreen(),
//         ),
//     );
//   }
// }

// SECTION - Widgets

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/provider/theme_provider.dart';

// DESC - all the screens in the app without Counter with riverpod
// void main() {
//   runApp( const MainApp() );
// }

// DESC - Only for management of state with riverpod
void main() {
  runApp(
    const ProviderScope(
      child: MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  // DESC - To use with navigation of example 1
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     theme: AppTheme(isDarkMode: false, selectedColor: 1).getTheme(),
  //     home: const HomeScreen(),
  //   );
  // }

  // DESC - To use with navigation of example 2
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     theme: AppTheme(isDarkMode: false, selectedColor: 1).getTheme(),
  //     home: const HomeScreen(),
  //     routes: {
  //       '/buttons': (context) => const ButtonScreen(),
  //       '/cards': (context) => const CardsScreen(),
  //     },
  //   );
  // }

  // DESC - To use with navigation of go-router
  @override
  Widget build(BuildContext context, ref) {
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(isDarkMode: isDarkMode, selectedColor: selectedColor ).getTheme(),
    );
  }

}
