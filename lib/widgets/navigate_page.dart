// ignore_for_file: empty_catches

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigatePage {
  push(BuildContext context, Widget page) {
    try {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return page;
          },
        ),
      );
    } catch (e) {}
  }

  pushAndRemoveUntil(BuildContext context, Widget page) {
    try {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) {
            return page;
          },
        ),
        (route) => false,
      );
    } catch (e) {}
  }

  pushReplacement(BuildContext context, Widget page) {
    try {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => page));
    } catch (e) {}
  }

  pop(BuildContext context) {
    try {
      Navigator.of(context).pop();
    } catch (e) {}
  }

  pushWithoutContext(Widget page) {
    try {
      Get.to(page);
    } catch (e) {}
  }
}
