import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';

appAppBar({
  required String title,
  List<Widget>? actions,
  Widget? developerPage,
}) {
  return kheasydevAppBar(
    title: title,
    logoPath: 'assets/logo.png',
    primaryColor: Colors.black,
    shadowColor: Colors.black87,
    actions: actions,
    developerPage: developerPage,
  );
}
