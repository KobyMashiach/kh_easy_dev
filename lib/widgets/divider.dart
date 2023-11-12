part of kh_easy_dev;

Widget kheasydevDivider({double? height, EdgeInsets? padding}) {
  return Padding(
    padding: padding ?? const EdgeInsets.only(top: 8),
    child: SizedBox(
      height: height ?? 1,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white10,
              Colors.white,
              Colors.white10,
            ],
            stops: [0.0, 0.5, 1.0],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
      ),
    ),
  );
}

Widget kheasydevVerticalDivider({double? height, EdgeInsets? padding}) {
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
