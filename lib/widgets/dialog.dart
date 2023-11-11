part of kh_easy_dev;

class KheasydevDialog extends StatefulWidget {
  final double? height;
  final double? width;
  final String? title;
  final Widget? child;
  final List<GenericButtonModel>? buttons;
  final bool isButtonsVertical;
  final bool isDismissable;
  final bool headerSpacing;
  final Duration? duration;
  final String? description;
  final List<String>? descriptions;
  final bool? shouldDisplayX;
  final Color primaryColor;
  final Color buttomBackground;

  const KheasydevDialog({
    super.key,
    this.height,
    this.width,
    this.title,
    this.shouldDisplayX,
    this.child,
    this.buttons,
    this.isButtonsVertical = false,
    this.isDismissable = true,
    this.headerSpacing = false,
    this.duration,
    this.description,
    this.descriptions,
    required this.primaryColor,
    required this.buttomBackground,
  });

  @override
  State<KheasydevDialog> createState() => _KheasydevDialogState();
}

class _KheasydevDialogState extends State<KheasydevDialog> {
  Timer? _timer;
  late bool shouldDisplayX;

  Widget _buildButtons(BuildContext context) {
    final uiButtons = widget.buttons!.map((buttonModel) {
      late ButtonStyleButton button;
      switch (buttonModel.type) {
        case GenericButtonType.elevated:
          button = ElevatedButton(
            onPressed: buttonModel.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonModel.color ?? Colors.white70,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                buttonModel.text,
              ),
            ),
          );
          break;
        case GenericButtonType.text:
          button = TextButton(
              onPressed: buttonModel.onPressed,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  buttonModel.text,
                ),
              ));
          break;
        case GenericButtonType.outlined:
          button = OutlinedButton(
              onPressed: buttonModel.onPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
                side: BorderSide(color: Theme.of(context).primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  buttonModel.text,
                ),
              ));
          break;
      }
      if (widget.isButtonsVertical || buttonModel.width != null) {
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: widget.isButtonsVertical ? 8 : 0,
              horizontal: widget.isButtonsVertical ? 0 : 8),
          child: SizedBox(
            height: buttonModel.height,
            width: buttonModel.width,
            // (constraints.maxWidth -
            //         ((widget.isButtonsVertical ? 0 : 16) *
            //             widget.buttons!.length)) /
            //     widget.buttons!.length,
            child: button,
          ),
        );
      } else {
        Widget child = Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            height: buttonModel.height,
            // width: (constraints.maxWidth - (16 * widget.buttons!.length)) /
            //     widget.buttons!.length,
            child: button,
          ),
        );
        if (buttonModel.fit == FlexFit.loose) {
          child = Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                height: buttonModel.height,
                child: button,
              ),
            ),
          );
        }
        return Flexible(fit: buttonModel.fit, child: child);
      }
    }).toList();

    if (widget.isButtonsVertical) {
      return Column(
        children: uiButtons,
      );
    } else {
      return Row(
        children: uiButtons,
      );
    }
  }

  @override
  void initState() {
    if (widget.duration != null) {
      _timer = Timer.periodic(widget.duration!, (timer) {
        Navigator.of(context).pop();
      });
    }
    shouldDisplayX = widget.shouldDisplayX ?? true;
    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return widget.isDismissable;
        },
        child: SimpleDialog(
          backgroundColor: widget.primaryColor ?? Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          contentPadding: const EdgeInsets.all(10),
          children: [
            if (widget.isDismissable ||
                widget.title != null ||
                widget.description != null ||
                widget.descriptions != null)
              Stack(
                children: [
                  if (widget.isDismissable && shouldDisplayX)
                    Container(
                      decoration: ShapeDecoration(
                          shape: const CircleBorder(),
                          color: widget.buttomBackground ?? Colors.white),
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
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (widget.isDismissable) Container(height: 25),
                      if (widget.title != null)
                        Text(
                          widget.title!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      if (widget.descriptions != null)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...widget.descriptions!.map((description) => Text(
                                  description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                  textAlign: TextAlign.center,
                                ))
                          ],
                        ),
                      if (widget.description != null)
                        Center(
                          child: Text(
                            widget.description!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      const SizedBox(height: 15)
                    ],
                  )
                ],
              )
            else
              const SizedBox(
                height: 20,
              ),
            if (widget.child != null)
              SizedBox(
                  height: widget.height,
                  width: widget.width,
                  child: widget.child),
            if (widget.buttons != null && widget.buttons!.isNotEmpty)
              _buildButtons(context)
          ],
        ));
  }
}

class GenericDialogModel {
  final List<GenericButtonModel>? buttons;
  final String? title;
  final String? description;
  final Widget? widget;
  final Widget? topIcon;
  final double? width;
  final EdgeInsets? topIconPadding;
  // final List<AlgoElevatedButton>? verticalButtons;

  GenericDialogModel(
      {required this.buttons,
      this.title,
      this.description,
      this.widget,
      // this.verticalButtons,
      this.topIcon,
      this.width,
      this.topIconPadding});
}

class GenericDialogSettings {
  final Widget? widget;
  final Widget? topIcon;
  final double? width;

  GenericDialogSettings({this.widget, this.topIcon, this.width});
}

class GenericButtonModel {
  final Function()? onPressed;
  final String text;
  final double? height;
  final double? width;
  final bool? disabled;
  final GenericButtonType type;
  final TextStyle? textStyle;
  final Color? color;
  final FlexFit fit;

  GenericButtonModel({
    this.onPressed,
    required this.text,
    this.height,
    this.color,
    this.width,
    this.disabled,
    required this.type,
    this.textStyle,
    this.fit = FlexFit.tight,
  });
}

enum GenericButtonType {
  elevated,
  text,
  outlined,
}
