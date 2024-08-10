import 'package:app_widgets/config/responsive_size.dart';
import 'package:flutter/material.dart';

const List<Map<String, dynamic>> cards = [
  {'elevation' : 0.0, 'label' : 'Elev. 0'},
  {'elevation' : 1.0, 'label' : 'Elev. 1'},
  {'elevation' : 2.0, 'label' : 'Elev. 2'},
  {'elevation' : 3.0, 'label' : 'Elev. 3'},
  {'elevation' : 4.0, 'label' : 'Elev. 4'},
  {'elevation' : 5.0, 'label' : 'Elev. 5'},
  {'elevation' : 6.0, 'label' : 'Elev. 6'},
];


class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
      appBar: AppBar(
        title: const Text('Tarjetas'),
      ),
      body: _CardsView(color: color),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView({required this.color});
  final ColorScheme color;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(bottom: sh(0.05, context)),
      child: Column(
        children: [
          ...cards.map(
            (card) => _Card1(label: card['label'], elevation: card['elevation'])
          ),
          ...cards.map(
            (card) => _Card2(label: card['label'], elevation: card['elevation'], color: color,)
          ),
          ...cards.map(
            (card) => _Card3(label: card['label'], elevation: card['elevation'], color: color,)
          ),
          ...cards.map(
            (card) => _Card4(label: card['label'], elevation: card['elevation'], color: color,)
          ),
        ]
      )
    );
  }
}

class _Card1 extends StatelessWidget {
  final String label;
  final double elevation;
  const _Card1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: elevation,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_outlined)
                  )
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(label),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: sh(0.01, context),)
      ],
    );
  }
}

class _Card2 extends StatelessWidget {
  final String label;
  final double elevation;
  final ColorScheme color;
  const _Card2({required this.label, required this.elevation, required this.color,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: color.outline
            ),
            borderRadius: BorderRadius.circular(20)
          ),
          elevation: elevation,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_outlined)
                  )
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('$label - outline'),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: sh(0.01, context),)
      ],
    );
  }
}

class _Card3 extends StatelessWidget {
  final String label;
  final double elevation;
  final ColorScheme color;
  const _Card3({required this.label, required this.elevation, required this.color,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: color.primaryFixedDim,
          elevation: elevation,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_outlined)
                  )
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('$label - filled'),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: sh(0.01, context),)
      ],
    );
  }
}

class _Card4 extends StatelessWidget {
  final String label;
  final double elevation;
  final ColorScheme color;
  const _Card4({required this.label, required this.elevation, required this.color,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          clipBehavior: Clip.hardEdge,
          elevation: elevation,
          child: Stack(
            children: [
              Image.network(
                'https://picsum.photos/id/${elevation.toInt()}/600/150',
                height: 150,
                fit: BoxFit.fitHeight,
              ),
              Positioned(
                top: sh(0.01, context),
                right: sw(0.02, context),
                child: IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.white.withAlpha(230)),
                    iconColor: const WidgetStatePropertyAll(Colors.black),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert_outlined)
                )
              ),
            ],
          ),
        ),
        SizedBox(height: sh(0.01, context),)
      ],
    );
  }
}