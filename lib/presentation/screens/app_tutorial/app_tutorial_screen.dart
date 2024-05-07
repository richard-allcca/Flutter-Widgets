import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// INFO - Para esta pantalla se utilizo assets y su configuración

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Pariatur dolore do culpa amet ad exercitation sint elit culpa nulla aliqua sunt.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rápida',
      'Pariatur dolore do culpa amet ad exercitation sint elit culpa nulla aliqua sunt.',
      'assets/images/2.png'),
  SlideInfo(
      'Busca Disfruta la comida',
      'Pariatur dolore do culpa amet ad exercitation sint elit culpa nulla aliqua sunt.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {

  // Para utilizar rutas con nombre de go-router
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();

  bool endReached = false;

  @override
  void initState() { // controla el cicle de vida de un stateFullWidget
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if( !endReached && page >= (slides.length - 1.5)){
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {// Necesario para limpiar el listener o el controller
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Stack(
        children: [

          // Crea un slider cada elemento ocupa toda la pantalla
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((e) => _Slide(
                    title: e.title, caption: e.caption, imageUrl: e.imageUrl))
                .toList(), // para que sea una lista de widgets
          ),

          // Button to scape
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              child: const Text(
                'Salir',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () => context.pop(),
            ),
          ),

          // Ternario para validar final del slider y mostrar el button
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15, // Indica que se mueva 15 unidades similar a pixeles
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Comenzar'),
                    ),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    // return const Placeholder();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // align row
          crossAxisAlignment: CrossAxisAlignment.start, // align column
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
