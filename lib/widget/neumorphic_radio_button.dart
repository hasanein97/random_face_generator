import 'package:flutter/material.dart';
import '../constant/string.dart';
import '../theme/theme.dart';

class NeumorphicRadioButton extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final VoidCallback onTap;
  const NeumorphicRadioButton(
      {Key? key,
        required this.isSelected,
        required this.icon,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: AnimatedContainer(
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          decoration: BoxDecoration(
            border: (isSelected)
                ? CustomeTheme(Theme.of(context).brightness == Brightness.dark)
                .border
                : null,
          ),
          child: Icon(
            icon,
            color: kRegentGray,
          ),
        ),
      ),
    );
  }
}