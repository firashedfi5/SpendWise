import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({super.key});

  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

List<String> themes = ['Light', 'Dark'];

class _ThemeSelectorState extends State<ThemeSelector> {
  String currentTheme = themes[0];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        themes.length,
        (index) => RadioListTile(
          activeColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius24),
          ),
          controlAffinity: ListTileControlAffinity.trailing,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 2,
          ),
          title: Text(themes[index]),
          value: themes[index],
          groupValue: currentTheme,
          onChanged: (value) {
            setState(() {
              currentTheme = value.toString();
            });
            log(currentTheme);
          },
        ),
      ),
    );
  }
}
