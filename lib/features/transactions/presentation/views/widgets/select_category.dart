import 'package:flutter/material.dart';
import 'package:spendwise/core/utils/styles.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Category', style: Styles.textStyle18),
        const SizedBox(height: 8),
        Row(
          children: [ 
            FilterChip(label: const Text('Sallery'), onSelected: (value) {}),
            const SizedBox(width: 8),
            FilterChip(label: const Text('Sallery'), onSelected: (value) {}),
            // const SizedBox(width: 8),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add, size: 30)),
          ],
        ),
      ],
    );
  }
}
