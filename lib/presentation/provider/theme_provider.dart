import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';


// State mutable
final themeProvider = StateProvider((ref) => false);

// State Inmutable
final colorListProvider = Provider((ref) => colorList);

// Un simple int mutable
final selectedColorProvider = StateProvider((ref) => 0);