import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onPressed: () =>
                // ref.read(isDarkModeProvider.notifier).update((state) => !state),

                ref.read(themeNotifierProvider.notifier).toggleDarkMode(),
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colorList = ref.watch(colorListProvider);

    final int selectedIndexColor =
        ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder: (context, index) {
        final color = colorList[index];
        return RadioListTile(
            title: Text(
              'Este Color',
              style: TextStyle(color: color),
            ),
            subtitle: Text(
              '${color.value}',
              style: TextStyle(color: color),
            ),
            activeColor: color,
            value: index,
            groupValue: selectedIndexColor,
            onChanged: (value) {
              // ref
              //     .read(selectedIndexColorProvider.notifier)
              //     .update((state) => index);
              ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
            });
      },
    );
  }
}
