import 'package:app_widgets/config/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  static String name = 'buttons_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Botones'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return SizedBox(
      width: sw(0.9, context),
      child: Padding(
        padding: EdgeInsets.all(sw(0.05, context)),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: sw(0.02, context),
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            const ElevatedButton(onPressed: null, child:  Text('ElevatedOff')),
            ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.access_alarm_sharp), label: const Text('ElevatedIcon')),
            FilledButton(onPressed: (){}, child: const Text('Filled')),
            FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.access_alarm_rounded), label: const Text('FilledIcon')),
            OutlinedButton(onPressed: (){}, child: const Text('Outlined')),
            OutlinedButton.icon(onPressed: (){}, icon: const Icon(Icons.access_alarm), label: const Text('OutlinedIcon')),
            TextButton(onPressed: (){}, child: const Text('Text')),
            TextButton.icon(onPressed: (){}, icon: const Icon(Icons.access_alarm), label: const Text('TextIcon')),
            IconButton(onPressed: (){}, icon: const Icon(Icons.access_alarm), tooltip: 'Icon',),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.access_alarm), 
              style: ButtonStyle(
                iconColor: WidgetStatePropertyAll(color.inversePrimary), 
                backgroundColor: WidgetStatePropertyAll(color.primary)
              ), 
              tooltip: 'IconFondo'
            ),
            _CustomButton(color: color)
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {

  final ColorScheme color;

  const _CustomButton({required this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(sw(0.03, context)),
      child: Material(
        color: color.primary,
        child: InkWell(
          onTap: (){},
          child: Padding(
            padding: EdgeInsets.all(sw(0.03, context)),
            child: const Text('Custom', style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}