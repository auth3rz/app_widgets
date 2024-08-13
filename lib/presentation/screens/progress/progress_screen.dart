import 'package:app_widgets/config/responsive_size.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

  static const name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Progress Indicators'),
        centerTitle: false,
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        children: [
          SizedBox(height: sh(0.02, context),),
          const Text('Circular'),
          SizedBox(height: sh(0.01, context),),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black38,
            color: color.primary,
          ),
          SizedBox(height: sh(0.02, context),),
          const Text('Circular y Linear controlados'),
          SizedBox(height: sh(0.01, context),),
          StreamBuilder<Object>(
            stream: Stream.periodic(const Duration(milliseconds: 300), (value){
              return (value * 2) / 100;
            }).takeWhile((value) => value <= 100),
            builder: (context, snapshot) {
              final double data = snapshot.data != null ? double.parse('${snapshot.data}') : 0;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularProgressIndicator(
                    value: data,
                    strokeWidth: 2,
                    backgroundColor: Colors.black12,
                    color: color.primary,
                  ),
                  SizedBox(
                    width: sw(0.6, context),
                    child: LinearProgressIndicator(
                      value: data,
                      backgroundColor: Colors.black12,
                      color: color.primary,
                    ),
                  )
                ],
              );
            }
          ),
        ],
      ),
    );
  }
}