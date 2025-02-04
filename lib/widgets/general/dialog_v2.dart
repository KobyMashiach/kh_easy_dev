import 'package:flutter/material.dart';
import 'package:kh_easy_dev/widgets/input/app_button_widget.dart';

class KhEasydevDialogV2 extends StatelessWidget {
  final String? title;
  final String? description;
  final bool shouldDisplayX;
  final Color? backgroundColor;
  final Color? primaryColor;
  final Color? buttonsTextColor;
  final double? buttonsTextSize;
  final double? titleTextSize;
  final double? descriptionTextSize;
  final bool oneButton;
  final bool noButtons;
  final List<Widget>? buttons;
  final String? okButtonText;
  final String? cancelButtonText;
  final bool childBeforeTitle;
  final Widget? child;
  final double? height;
  final double? width;
  final VoidCallback? okButtonOnTap;
  final VoidCallback? cancelButtonOnTap;

  const KhEasydevDialogV2(
      {super.key,
      this.title,
      this.description,
      this.shouldDisplayX = true,
      this.backgroundColor,
      this.primaryColor,
      this.buttonsTextColor,
      this.buttonsTextSize,
      this.titleTextSize,
      this.descriptionTextSize,
      this.oneButton = false,
      this.noButtons = false,
      this.buttons,
      this.okButtonText,
      this.cancelButtonText,
      this.childBeforeTitle = false,
      this.child,
      this.height,
      this.width,
      this.okButtonOnTap,
      this.cancelButtonOnTap});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: backgroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      contentPadding: const EdgeInsets.all(10),
      children: [
        Stack(
          children: [
            if (shouldDisplayX)
              Align(
                alignment: Directionality.of(context) == TextDirection.ltr
                    ? Alignment.topLeft
                    : Alignment.topRight,
                child: xButtonUI(context),
              ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (child != null && childBeforeTitle) child!,
                    if (title != null)
                      Text(
                        title!,
                        style: TextStyle(
                          fontSize: titleTextSize ?? 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    if (description != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          description!,
                          style: TextStyle(
                            fontSize: descriptionTextSize ?? 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    if (child != null && !childBeforeTitle)
                      if (child != null)
                        SizedBox(height: height, width: width, child: child),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        if (buttons != null)
                          ...buttons!
                              .map((button) => Expanded(child: button))
                              .toList(),
                        if (buttons == null && !noButtons) ...[
                          Expanded(
                            child: kheasydevAppButton(
                              text: okButtonText ?? "OK",
                              textSize: buttonsTextSize,
                              primaryColor: primaryColor,
                              textColor: buttonsTextColor,
                              onTap: okButtonOnTap ??
                                  () => Navigator.of(context).pop(true),
                            ),
                          ),
                          if (!oneButton)
                            Expanded(
                              child: kheasydevAppButton(
                                text: cancelButtonText ?? "Cancel",
                                textSize: buttonsTextSize,
                                primaryColor: primaryColor,
                                unfillColors: true,
                                textColor: buttonsTextColor,
                                onTap: cancelButtonOnTap ??
                                    () => Navigator.of(context).pop(false),
                              ),
                            ),
                        ]
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Container xButtonUI(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        shape: CircleBorder(),
        color: Colors.white,
      ),
      width: 26,
      height: 26,
      child: FittedBox(
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          iconSize: 28,
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
