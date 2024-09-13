import 'package:app_widgets/config/responsive_size.dart';
import 'package:app_widgets/config/theme/app_theme.dart';
import 'package:app_widgets/presentation/providers/is_dark_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static String name = 'ThemeScreen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer Screen'),
        actions: [
          GestureDetector(
            onTap: () => ref.read(darkModeProvider.notifier).update((dark) => !dark),
            child: Padding(
              padding: EdgeInsets.all(sw(0.02, context)),
              child: Icon(
                ref.watch(darkModeProvider) ? Icons.sunny : Icons.dark_mode
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: colorList.length,
        itemBuilder: (BuildContext contex, index){
          return RadioListTile(
            value: index, 
            groupValue: ref.watch(colorValue), 
            onChanged: (_) => ref.read(colorValue.notifier).state = index,
            activeColor: colorList[index],
            title: Text(
              'Este color',
              style: TextStyle(
                color: colorList[index],
                fontWeight: FontWeight.w700
              ),
            ),
          );
          // return GestureDetector(
          //   onTap: () => ref.read(colorValue.notifier).state = index,
          //   child: Row(
          //     children: [
          //       Text('  $index'),
          //       Container(
          //         width: sw(0.05, context),
          //         height: sw(0.05, context),
          //         margin: EdgeInsets.all(sw(0.03, context)),
          //         color: colorList[index],
          //       )
          //     ],
          //   ),
          // );
        }
      ),
    );
  }
}