import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/styles.dart';

class CustomSegmentedButton extends StatefulWidget {
  const CustomSegmentedButton({super.key});

  @override
  State<CustomSegmentedButton> createState() => _CustomSegmentedButtonState();
}

class _CustomSegmentedButtonState extends State<CustomSegmentedButton> {
  Set<String> _selected = {'Expenses'};

  void updateSelected(Set<String> newSelection) {
    setState(() {
      _selected = newSelection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(kPadding24, 0, kPadding24, 20),
      sliver: SliverToBoxAdapter(
        child: AspectRatio(
          aspectRatio: 2 / .3,
          child: SegmentedButton(
            showSelectedIcon: false,
            style: ButtonStyle(
              textStyle: WidgetStateProperty.all(
                Styles.textStyle16.copyWith(fontWeight: FontWeight.w500),
              ),
              side: WidgetStateProperty.all(BorderSide.none),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    14,
                  ), // Slightly smaller than container
                ),
              ),
              backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                states,
              ) {
                if (states.contains(WidgetState.selected)) {
                  if (_selected.contains('Income')) {
                    return kPrimaryColor;
                  } else if (_selected.contains('Expenses')) {
                    return kSecondaryColor;
                  }
                }
                return Colors.white;
              }),
              foregroundColor: WidgetStateProperty.resolveWith<Color?>((
                states,
              ) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.white;
                }
                return Colors.black;
              }),
            ),
            segments: const <ButtonSegment<String>>[
              ButtonSegment<String>(value: 'Income', label: Text('Income')),
              ButtonSegment<String>(value: 'Expenses', label: Text('Expenses')),
            ],
            selected: _selected,
            onSelectionChanged: updateSelected,
          ),
        ),
      ),
    );
  }
}
