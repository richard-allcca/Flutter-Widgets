import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

// LINK - doc buttons - https://m3.material.io/develop/flutter

class CardsScreen extends StatelessWidget {

  // Para utilizar rutas con nombre de go-router
  static const String name = 'cards_Screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards screen'),
      ),
      body: _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Permite tener un scroll vertical
      child: Column(
        children: [
          const Text('Cards normales'),
          ...cards.map((card) => _CardType1(elevation: card['elevation'],label: card['label'],)),

          const Text('Cards Outline'),
          ...cards.map((card) => _CardType2(elevation: card['elevation'],label: card['label'],)),

          const Text('Cards Filled'),
          ...cards.map((card) => _CardType3(elevation: card['elevation'],label: card['label'],)),

          const Text('Cards With images'),
          ...cards.map((card) => _CardType4(elevation: card['elevation'],label: card['label'],)),
          // Final space
          const SizedBox(height: 100,) // to add space for the final space
        ],
      ),
    );
  }
}


// Normal Cards (without border radius)
class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    // final colors = Theme.of(context).colorScheme;

    return Card(
      // shape:  RoundedRectangleBorder( // Border radius
      //   borderRadius: const BorderRadius.all(Radius.circular(12)),
      //   side: BorderSide(
      //     color: colors.outline,
      //     width: 0.3,
      //   )
      // ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: (){},
              )
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ]
        ),
      ),
    );
  }
}

// Outline Cards (border radius)
class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      shape:  RoundedRectangleBorder( // Border radius
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        side: BorderSide(
          color: colors.outline
        )
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: (){},
              )
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            )
          ]
        ),
      ),
    );
  }
}

// Filled Cards
class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType3({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: (){},
              )
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ]
        ),
      ),
    );
  }
}

// Cards with images
class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType4({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      clipBehavior: Clip.hardEdge, // Prevent overflow of images at container boundaries
      elevation: elevation,
      child: Stack( // Allows one element over another like z-index
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/250',
            height: 200,
            fit: BoxFit.cover,
          ),

          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
              ),
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: (){},
              ),
            )
          ),
        ]
      ),
    );
  }
}