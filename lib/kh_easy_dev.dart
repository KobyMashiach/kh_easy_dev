//! dart pub publish
//! pubish new version

//? change version
//? change changeLOG

library kh_easy_dev;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kh_easy_dev/services/contactus_transalte.dart';
import 'dart:async';
import 'package:kh_easy_dev/services/navigate_page.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// widgets
part 'widgets/general/app_toast.dart';
part 'widgets/general/dialog.dart';
part 'widgets/general/appbar.dart';
part 'widgets/general/app_bottom_sheet.dart';
part 'widgets/onwillpop.dart';
part 'widgets/general/side_menu.dart';
part 'widgets/design/divider.dart';
part 'widgets/design/app_drawer.dart';

// screens
part 'screens/contactus.dart';

// design
part 'designs/drawer_design.dart';

// models
part 'models/contactus_model.dart';
part 'models/sidebar_model.dart';
part 'models/drawer_button_model.dart';
part 'models/bottom_sheet_button_model.dart';
