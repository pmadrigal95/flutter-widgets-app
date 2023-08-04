import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

///
/// Provider : Mantener valores INMUTABLE
///
/// StateProvider: Mantener una pieza de estado
///
/// StateNotifierProvider: Mantener un estado con objectos elaborados (clases)

// State Provider almacenar un estado

// Bolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Un simple int
final selectedIndexColorProvider = StateProvider<int>((ref) => 0);

// Listado de colores inmutables
final colorListProvider = Provider<List<Color>>((ref) => colorList);

/// StateNotifierProvider: Mantener un estado con objectos elaborados (clases)

// Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

// Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // STATE = Estado = new AppTheme();
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
