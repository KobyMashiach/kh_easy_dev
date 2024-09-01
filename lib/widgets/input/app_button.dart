import 'package:flutter/material.dart';

class KheasydevAppButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final bool unfillColors;
  final bool disableColors;
  final EdgeInsets? padding;
  final double? textSize;
  final Color? primaryColor;
  final Color? textColor;

  const KheasydevAppButton({
    super.key,
    this.onTap,
    required this.text,
    this.unfillColors = false,
    this.disableColors = false,
    this.padding,
    this.textSize,
    this.primaryColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        margin: padding ?? const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            color: !disableColors
                ? !unfillColors
                    ? primaryColor ?? Colors.black
                    : Colors.white
                : Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
            border: !unfillColors || disableColors
                ? null
                : Border.all(color: primaryColor ?? Colors.black)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: !disableColors
                  ? !unfillColors
                      ? Colors.white
                      : primaryColor ?? Colors.black
                  : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: textSize ?? 20,
            ),
          ),
        ),
      ),
    );
  }
}
