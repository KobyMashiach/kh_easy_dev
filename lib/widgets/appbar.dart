part of kh_easy_dev;

AppBar kheasydevAppBar({
  required String title,
  List<Widget>? actions,
  required String logoPath,
  required Color primaryColor,
  required Color shadowColor,
  Widget? developerPage,
}) {
  return AppBar(
    backgroundColor: primaryColor,
    title: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title ?? "K&H Easy Dev",
              overflow: TextOverflow.clip,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          verticalDivider(),
          Image.asset(
            logoPath,
            width: 60,
            height: 60,
          ),
        ],
      ),
    ),
    actions: developerPage != null
        ? [
            ...actions ?? [],
            GoToDeveloperPage(developerPage),
          ]
        : actions ?? [],
    centerTitle: true,
    toolbarHeight: 70,
    elevation: 20,
    shadowColor: shadowColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}

GestureDetector GoToDeveloperPage(Widget page) {
  return GestureDetector(
    onLongPress: () => KheasydevNavigatePage().pushWithoutContext(page),
    child: const Icon(
      Icons.add,
      color: Colors.transparent,
      size: 50,
    ),
  );
}

Padding verticalDivider() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: SizedBox(
      width: 1,
      height: 60,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white10,
              Colors.white,
              Colors.white10,
            ],
            stops: [0.0, 0.5, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    ),
  );
}
