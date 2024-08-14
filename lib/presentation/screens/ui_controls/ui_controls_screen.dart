import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {

  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI - Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Formas {square, circle, triangle, rectangle}


class _UiControlsViewState extends State<_UiControlsView> {

  bool isDeveloper    = true;
  bool quiereDesayuno = false;
  bool quiereAlmuerzo = false;
  bool quiereCena     = false;

  Formas formas = Formas.square;

  IconData muestra = Icons.square;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (v) => setState(() => isDeveloper = v)
        ),
        ExpansionTile(
          title: const Text('Forma geométrica'),
          subtitle: Text('$formas'),
          children: [
            radioR('square',    'cuadrada',    Formas.square,    Icons.square),
            radioR('circle',    'circular',    Formas.circle,    Icons.circle),
            radioR('triangle',  'triangular',  Formas.triangle,  Icons.play_arrow_sharp),
            radioR('rectangle', 'rectangular', Formas.rectangle, Icons.rectangle),
          ],
        ),
        Center(child: Icon(
          muestra, color: isDeveloper ? color.primary : color.inversePrimary,
        )),
        CheckboxListTile(
          title: const Text('¿Quiere desayuno?'),
          value: quiereDesayuno,
          onChanged: (v) => setState(() => quiereDesayuno = v!),
        ),
        CheckboxListTile(
          title: const Text('¿Quiere almuerzo?'),
          value: quiereAlmuerzo,
          onChanged: (v) => setState(() => quiereAlmuerzo = v!),
        ),
        CheckboxListTile(
          title: const Text('¿Quiere cena?'),
          value: quiereCena,
          onChanged: (v) => setState(() => quiereCena = v!),
        )
      ],
    );
  }

  Widget radioR(String tit, String subTit, Formas estaF, IconData elIco) {
    return RadioListTile(
      title     : Text(tit),
      subtitle  : Text('la forma es $subTit'),
      value     : estaF,
      groupValue: formas,
      onChanged : (v) => setState(() {
        formas  = v!;
        muestra = elIco;
      })
    );
  }
}