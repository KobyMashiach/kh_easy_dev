<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

write kheasydev before all the widgets

## Features

a lot of widgets to kheasydev applications

## Getting started

import 'package:kh_easy_dev/kh_easy_dev.dart';

## Usage

`/screens`
`/models`
`/widgets`

## Side Menu Example
```dart
appSideMenu(BuildContext context, {required int index}) {
  return KheasydevSideMenu(
    selectedIndex: index,
    shadowColor: AppColor.primaryColor,
    disableColor: AppColor.disableColor,
    appName: 'App Name',
    sidebarItems: [
      SideBarModel(
          icon: Icons.home,
          label: "page name 1",
          onTap: () {
            KheasydevNavigatePage().push(context, HomePage());
          }),
      SideBarModel(
          icon: Icons.check_box,
          label: "Page Name 2",
          onTap: () {
            KheasydevNavigatePage().push(context, TestPage());
          }),
      // SideBarModel(icon: Icons.abc, label: "label", onTap: () {})
    ],
    buttomBackground: AppColor.buttomBackground,
    appBar: appAppBar(title: 'יצירת קשר'),
  );
}
```

## Additional information

just to kh easy dev applications.
