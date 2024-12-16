part of kh_easy_dev;

class BottomSheetItemsModel {
  final String text;
  final Icon icon;
  final VoidCallback? onTap;

  BottomSheetItemsModel({
    required this.text,
    required this.icon,
    this.onTap,
  });
}
