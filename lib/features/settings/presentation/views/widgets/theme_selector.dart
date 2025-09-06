import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/features/settings/presentation/manager/theme_bloc/theme_bloc.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeMode>(
      builder: (context, themeMode) {
        final currentTheme = themeMode == ThemeMode.dark ? 'Dark' : 'Light';
        return Column(
          children: [
            RadioListTile(
              activeColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorderRadius24),
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              title: const Text('Light'),
              value: 'Light',
              groupValue: currentTheme,
              onChanged: (value) {
                context.read<ThemeBloc>().add(
                  const ThemeChanged(isDark: false),
                );
              },
            ),
            RadioListTile(
              activeColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorderRadius24),
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              title: const Text('Dark'),
              value: 'Dark',
              groupValue: currentTheme,
              onChanged: (value) {
                context.read<ThemeBloc>().add(const ThemeChanged(isDark: true));
              },
            ),
          ],
        );
      },
    );
  }
}
