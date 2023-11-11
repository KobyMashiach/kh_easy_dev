part of kh_easy_dev;

class SideBarModel {
  final IconData icon;
  final String label;
  final dynamic Function()? onTap;

  SideBarModel({
    required this.icon,
    required this.label,
    required this.onTap,
  });
}
