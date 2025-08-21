import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

List<String> languages = ['English', 'French', 'Arabic'];

class _LanguageSelectorState extends State<LanguageSelector> {
  String currentLanguage = languages[0];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        3,
        (index) => RadioListTile(
          activeColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius24),
          ),
          controlAffinity: ListTileControlAffinity.trailing,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          title: Text(languages[index]),
          value: languages[index],
          groupValue: currentLanguage,
          onChanged: (value) {
            setState(() {
              currentLanguage = value.toString();
            });
            log(currentLanguage);
          },
        ),
      ),
    );
  }
}
