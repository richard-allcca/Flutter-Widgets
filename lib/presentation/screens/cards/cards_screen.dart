import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

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
    return SingleChildScrollView( // para hacer el scroll
      child: Column(
        children: [
          const Text('Cards nomales'),
          ...cards.map((card) => _CardType1(elevation: card['elevation'],label: card['label'],)),

          const Text('Cards Outline'),
          ...cards.map((card) => _CardType2(elevation: card['elevation'],label: card['label'],)),

          const Text('Cards Filled'),
          ...cards.map((card) => _CardType3(elevation: card['elevation'],label: card['label'],)),

          const Text('Cards With images'),
          ...cards.map((card) => _CardType4(elevation: card['elevation'],label: card['label'],)),
          // Final space
          const SizedBox(height: 100,)
        ],
      ),
    );
  }
}


// Normal Cards
class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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

// Outline Cards
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
      shape:  RoundedRectangleBorder(
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
      clipBehavior: Clip.hardEdge, // Prevent overflow
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/250',
            height: 350,
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