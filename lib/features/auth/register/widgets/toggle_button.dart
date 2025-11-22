import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/resources/styles_manager.dart';

// Assuming CustomToggleButton code is in a separate file or defined above

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ToggleButtonWidget extends StatefulWidget {
  const ToggleButtonWidget({super.key});

  @override
  State<ToggleButtonWidget> createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  // State variable to track the currently selected button
  String _selectedTitle = 'house';

  // State variable for the switch
  bool _isDefaultAddress = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Title type',
          style: StylesManager.font18BlackBold,
        ),
        verticalSpace(16),
        // --- Toggle Button Group ---
        Wrap(
          spacing: 8.0, // horizontal space between buttons
          runSpacing: 8.0, // vertical space between lines of buttons
          children: [
            CustomToggleButton(
              icon: Icons.home,
              label: 'house',
              isSelected: _selectedTitle == 'house',
              onTap: () {
                setState(() {
                  _selectedTitle = 'house';
                });
              },
            ),
            CustomToggleButton(
              icon: Icons.business,
              label: 'office',
              isSelected: _selectedTitle == 'office',
              onTap: () {
                setState(() {
                  _selectedTitle = 'office';
                });
              },
            ),
            CustomToggleButton(
              icon: Icons.storefront,
              label: 'architecture',
              isSelected: _selectedTitle == 'architecture',
              onTap: () {
                setState(() {
                  _selectedTitle = 'architecture';
                });
              },
            ),
          ],
        ),
        verticalSpace(25),
        // --- Switch Control ---
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Set as default address',
              style: StylesManager.font14Grey,
            ),
            Switch(
              value: _isDefaultAddress,
              onChanged: (bool newValue) {
                setState(() {
                  _isDefaultAddress = newValue;
                });
              },
              activeColor: ColorManager.primary,
              inactiveThumbColor: Colors.grey.shade500,
              inactiveTrackColor: Colors.grey.shade300,
            ),
          ],
        ),
      ],
    );
  }
}

class CustomToggleButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomToggleButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Define the colors based on the selection state
    const Color unselectedColor = Colors.white;
    final Color textColor = isSelected ? Colors.white : ColorManager.primary;
    final Color iconColor = isSelected ? Colors.white : ColorManager.primary;
    final Color borderColor = isSelected
        ? ColorManager.primary
        : ColorManager.primary.withOpacity(0.5);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? ColorManager.primary : unselectedColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: borderColor,
              width: 1.5,
            ),
            boxShadow: [
              // Subtle shadow for lift effect
              if (isSelected)
                BoxShadow(
                  color: ColorManager.primary.withOpacity(0.4),
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min, // Wrap content horizontally
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                label.toUpperCase(),
                style: StylesManager.font14Grey.copyWith(
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
