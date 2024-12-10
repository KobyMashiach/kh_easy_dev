part of kh_easy_dev;

class DrawerButtonModel {
  final String text;
  final Icon icon;
  final Widget? page;
  final VoidCallback? onTap;
  final bool enableColor;
  final Color? textIconColor;

  DrawerButtonModel({
    required this.text,
    required this.icon,
    this.page,
    this.onTap,
    required this.enableColor,
    this.textIconColor,
  });
}
