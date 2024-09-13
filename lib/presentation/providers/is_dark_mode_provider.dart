import 'package:flutter_riverpod/flutter_riverpod.dart';

final darkModeProvider = StateProvider<bool>((_) => false);

final colorValue = StateProvider<int>((_) => 1);