import 'package:app_widgets/config/responsive_size.dart';
import 'package:app_widgets/presentation/providers/counter_provider.dart';
import 'package:app_widgets/presentation/providers/is_dark_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counteValue = ref.watch(counterProvider);
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          GestureDetector(
            onTap: () {
              ref.read(darkModeProvider.notifier).update((dark) => !dark);
            },
            child: Padding(
              padding: EdgeInsets.all(sw(0.02, context)),
              child: Icon(
                ref.watch(darkModeProvider) ? Icons.wb_sunny_rounded : Icons.dark_mode_rounded
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: sh(0.01, context),),
          Center(
            child: Text(
              '$counteValue',
              style: TextStyle(
                fontSize: sh(0.05, context),
                fontWeight: FontWeight.w400,
                color: color.inverseSurface
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BotonBasico(icon: Icons.remove, que: false),
              BotonBasico(icon: Icons.replay, que: null),
              BotonBasico(icon: Icons.add,    que: true),
            ],
          )
        ],
      ),
    );
  }
}

class BotonBasico extends ConsumerWidget {
  
  final IconData icon;
  final bool ? que;

  const BotonBasico({
    super.key, 
    required this.icon, 
    this.que,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    var data = ref.read(counterProvider.notifier);
    return GestureDetector(
      onTap: () {
        if (que != null) {
          if (que!) {
            data.state++;
          } else {
            if (data.state > 0) {
              data.state--;
            }
          }
        } else {
          data.state = 0;
        }
      },
      onLongPress: () {
        if (que != null) {
          if (que!) {
            data.state += 10;
          } else {
            if (data.state > 9) {
              data.state -= 10;
            }
          }
        }
      },
      child: Container(
        padding: EdgeInsets.all(sw(0.02, context)),
        margin: EdgeInsets.all(sw(0.02, context)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(sw(0.02, context)),
          color: color.primary
        ),
        child: Icon(
          icon,
          color: color.surface,
        ),
      )
    );
  }
}