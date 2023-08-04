import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// State Provider almacenar un estado

// Bolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);


// Listado de colores inmutables
final colorListProvider = StateProvider<List<Color>>((ref) => colorList);

// Un simple int
final selectedIndexColorProvider = StateProvider<int>((ref) => 0);