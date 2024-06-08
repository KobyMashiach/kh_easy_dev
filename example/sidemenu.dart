import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';
import 'package:kh_easy_dev/widgets/navigate_page.dart';

appSideMenu(BuildContext context, {required int index, required Widget page}) {
  return KheasydevSideMenu(
    selectedIndex: index,
    shadowColor: Colors.green,
    disableColor: Colors.greenAccent,
    sidebarItems: [
      SideBarModel(
          icon: Icons.home,
          label: "עמוד נחיתה",
          onTap: () {
            KheasydevNavigatePage().push(context, page);
          }),
      SideBarModel(
          icon: Icons.check_box,
          label: "עמוד בדיקה",
          onTap: () {
            KheasydevNavigatePage().push(context, page);
          }),
      // SideBarModel(icon: Icons.abc, label: "label", onTap: () {})
    ],
    buttomBackground: Colors.lightGreen,
    appBar: kheasydevAppBar(title: 'do a toast'),
  );
}
