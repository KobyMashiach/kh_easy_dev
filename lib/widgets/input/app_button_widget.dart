import 'package:flutter/material.dart';

Widget kheasydevAppButton({
  Function()? onTap,
  required String text,
  bool unfillColors = false,
  bool disableColors = false,
  EdgeInsets? padding,
  EdgeInsets? margin,
  double? textSize,
  Color? primaryColor,
  Color? textColor,
  Widget? rightIcon,
  Widget? leftIcon,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: padding ?? const EdgeInsets.all(12.0),
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: !disableColors
            ? !unfillColors
                ? primaryColor ?? Colors.black
                : Colors.white
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
        border: !unfillColors || disableColors
            ? null
            : Border.all(color: primaryColor ?? Colors.black),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (leftIcon != null) leftIcon else const SizedBox(width: 24),
          Expanded(
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
                textAlign: TextAlign.center,
              ),
            ),
          ),
          if (rightIcon != null) rightIcon else const SizedBox(width: 24),
        ],
      ),
    ),
  );
}
