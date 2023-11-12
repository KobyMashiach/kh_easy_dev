part of kh_easy_dev;

AppBar kheasydevAppBar({
  required String title,
  List<Widget>? actions,
  String? logoPath,
  Color? primaryColor,
  Color? shadowColor,
  Widget? developerPage,
}) {
  return AppBar(
    backgroundColor: primaryColor ?? Colors.black,
    title: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.clip,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          kheasydevVerticalDivider(),
          GestureDetector(
            onLongPress: () => developerPage != null
                ? KheasydevNavigatePage().pushWithoutContext(developerPage)
                : null,
            child: Image.asset(
              logoPath ?? '',
              width: 60,
              height: 60,
            ),
          ),
        ],
      ),
    ),
    actions: actions ?? [],
    centerTitle: true,
    toolbarHeight: 70,
    elevation: 20,
    shadowColor: shadowColor ?? Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
