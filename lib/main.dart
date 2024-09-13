import 'package:app_widgets/config/goRuter/go_router.dart';
import 'package:app_widgets/config/theme/app_theme.dart';
import 'package:app_widgets/presentation/providers/is_dark_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor = ref.watch(colorValue);
    final isDark = ref.watch(darkModeProvider);
    return MaterialApp.router(
      title: 'WidgetsAPP',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: selectedColor, isDark: isDark).getTheme(),
    );
  }
}
