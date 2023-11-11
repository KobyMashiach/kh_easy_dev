library kh_easy_dev;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:kh_easy_dev/widgets/navigate_page.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:in_app_review/in_app_review.dart';

// widgets
part 'widgets/app_toast.dart';
part 'widgets/easy_news_dialog.dart';
part 'widgets/easynews_appbar.dart';
part 'widgets/onwillpop.dart';
part 'widgets/side_menu.dart';
part 'widgets/divider.dart';

// screens
part 'screens/contactus.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
