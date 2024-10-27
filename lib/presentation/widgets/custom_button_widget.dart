import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

enum ButtonStyleType { primary, secondary, outline, text }

class CustomButton extends StatelessWidget {
  final String text;
  final ButtonStyleType styleType;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isExpanded;
  final bool hasBorder;
  final Color? color;

  const CustomButton({
    Key? key,
    required this.text,
    required this.styleType,
    required this.onPressed,
    this.icon,
    this.isExpanded = false,
    this.hasBorder = true,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = _getButtonStyle(context);

    Widget buttonContent = Container(
      decoration: BoxDecoration(
        gradient: styleType == ButtonStyleType.primary
            ? const LinearGradient(
                colors: [Color(0xFF2BAFEF), Color(0xFFDC86ED)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : null,
        borderRadius: BorderRadius.circular(hasBorder ? 30 : 8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(hasBorder ? 30 : 8),
        child: ElevatedButton(
          onPressed: onPressed,
          style: buttonStyle.copyWith(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: icon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon),
                    const SizedBox(width: 8),
                    Text(text),
                  ],
                )
              : Text(text),
        ),
      ),
    );

    if (isExpanded) {
      return SizedBox(
        width: double.infinity,
        child: buttonContent,
      );
    } else {
      return buttonContent;
    }
  }

  ButtonStyle _getButtonStyle(BuildContext context) {
    BorderRadius borderRadius =
        hasBorder ? BorderRadius.circular(30) : BorderRadius.circular(8);

    switch (styleType) {
      case ButtonStyleType.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        );
      case ButtonStyleType.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade700,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          textStyle: const TextStyle(fontSize: 16),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        );
      case ButtonStyleType.outline:
        return OutlinedButton.styleFrom(
          foregroundColor: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          textStyle: const TextStyle(fontSize: 16),
          side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        );
      case ButtonStyleType.text:
        return TextButton.styleFrom(
          foregroundColor: Theme.of(context).primaryColor,
          padding: EdgeInsets.zero,
          textStyle: const TextStyle(fontSize: 16),
          backgroundColor: Colors.transparent,
          elevation: 0,
        );
      default:
        return ElevatedButton.styleFrom();
    }
  }
}
