// ignore_for_file: empty_catches

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KheasydevNavigatePage {
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

  pop(BuildContext context, {dynamic value}) {
    try {
      Navigator.of(context).pop(value);
    } catch (e) {}
  }

  pushWithoutContext(Widget page) {
    try {
      Get.to(page);
    } catch (e) {}
  }

  pushDuration(BuildContext context, Widget page,
      {Duration duration = const Duration(milliseconds: 300)}) {
    try {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => page,
          transitionDuration: duration,
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      );
    } catch (e) {}
  }

  pushAndRemoveUntilDuration(BuildContext context, Widget page,
      {Duration duration = const Duration(milliseconds: 300)}) {
    try {
      Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => page,
          transitionDuration: duration,
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
        (route) => false,
      );
    } catch (e) {}
  }

  pushReplacementDuration(BuildContext context, Widget page,
      {Duration duration = const Duration(milliseconds: 300)}) {
    try {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => page,
          transitionDuration: duration,
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      );
    } catch (e) {}
  }

  popDuration(BuildContext context,
      {dynamic value, Duration duration = const Duration(milliseconds: 300)}) {
    try {
      Navigator.of(context).pop(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => Container(),
          transitionDuration: duration,
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      );
    } catch (e) {}
  }

  maybePopDuration(BuildContext context,
      {dynamic value, Duration duration = const Duration(milliseconds: 300)}) {
    try {
      Navigator.of(context).maybePop(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => Container(),
          transitionDuration: duration,
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      );
    } catch (e) {}
  }
}
