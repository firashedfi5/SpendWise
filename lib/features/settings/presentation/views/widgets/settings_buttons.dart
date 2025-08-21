import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spendwise/core/utils/styles.dart';

class SettingsButtons extends StatelessWidget {
  const SettingsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.person, size: 20, color: Colors.white),
              ),
              const SizedBox(width: 8),
              const Text('Account Info', style: Styles.textStyle18),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  FontAwesomeIcons.globe,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              const Text('Language', style: Styles.textStyle18),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.dark_mode,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              const Text('Theme', style: Styles.textStyle18),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.info, size: 20, color: Colors.white),
              ),
              const SizedBox(width: 8),
              const Text('FAQs', style: Styles.textStyle18),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.send, size: 20, color: Colors.white),
              ),
              const SizedBox(width: 8),
              const Text('Send Feedback', style: Styles.textStyle18),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.logout, size: 20, color: Colors.white),
              ),
              const SizedBox(width: 8),
              const Text('Logout', style: Styles.textStyle18),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ],
    );
  }
}
