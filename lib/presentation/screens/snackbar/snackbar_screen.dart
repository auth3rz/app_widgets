import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar (BuildContext context) {

    final snack = ScaffoldMessenger.of(context);

    snack.clearSnackBars();

    final snackbang = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'ok', onPressed: (){}),
      duration: const Duration(seconds: 1),
    );

    snack.showSnackBar(snackbang);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Esto es un diálogo'),
        content: const Text('Pariatur nostrud ut nisi qui ex. Sunt deserunt dolor ut duis incididunt officia deserunt ea. Voluptate ullamco esse laborum eiusmod quis elit. Aute elit dolor sit aute.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
        
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(onPressed: () => showAboutDialog(
              context: context,
              children: [
                const Text('Minim exercitation tempor eiusmod sint dolore aliqua sint eu. Amet est pariatur pariatur voluptate commodo ipsum. Amet deserunt occaecat tempor duis consectetur excepteur proident in. Exercitation est consequat amet et quis reprehenderit incididunt non anim quis voluptate. Sunt enim adipisicing ex pariatur labore commodo.')
              ]
            ), child: const Text('Licencias Usadas')),
            FilledButton(onPressed: () => openDialog(context), child: const Text('Mostrar diálogo')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: Text(
          'Mostrar Snackbar',
          style: TextStyle(color: color.surface),
        ),
        backgroundColor: color.secondaryFixed,
        icon: Icon(
          Icons.remove_red_eye_outlined,
          color: color.surface,
        ),
      ),
    );
  }
}