import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// State mutable
final themeProvider = StateProvider((ref) => false);

final selectedColorProvider = StateProvider((ref) => 0);

// State Inmutable
final colorListProvider = Provider((ref) => colorList);

// Un objeto de tipo appTheme (custom)
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {

  // STATE = Estate = new AppTheme();
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode );
  }

  void changeColorIndex( int colorIndex ) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}

// INFO - For CounterScreen with provider of riverpod

final isDarkModeProvider = StateProvider((ref)=> false);
