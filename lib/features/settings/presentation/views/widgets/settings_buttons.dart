import 'package:flutter/material.dart';
import 'package:spendwise/core/enums/settings_buttons_enum.dart';
import 'package:spendwise/core/utils/styles.dart';

class SettingsButtons extends StatelessWidget {
  const SettingsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: SettingsButtonsEnum.values
          .map(
            (e) => TextButton(
              onPressed: () => e.execute(context),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: e.iconColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(e.icon, size: 20, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Text(e.title, style: Styles.textStyle18),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
