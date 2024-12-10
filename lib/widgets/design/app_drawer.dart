part of kh_easy_dev;

Widget kheasydevAppDrawerV2({
  required String name,
  String? profileImage,
  required Color color,
  List<DrawerButtonModel>? buttons,
  (String, String)? appDetails,
  Widget? contactUsScreen,
  required PreferredSizeWidget appBar,
  required Color contactsScreenButtomBackground,
  required Color contactsScreenDialogColor,
  String? playStore,
  String? appStore,
  bool? shareButton,
  bool? reviewButton,
  double? buttonsTextSize,
  BuildContext? context,
  String? languageCode,
  Color? menuButtonColor,
  Color? menuButtonEnableColor,
}) {
  final bool isRtl = Directionality.of(context!) == TextDirection.rtl;
  final double screenWidth = MediaQuery.of(context).size.width * 0.8;
  final double screenHeight = MediaQuery.of(context).size.height;
  final ContactusTransalte tempLanguageCode = getlanguageCodeEnum(languageCode);
  return Container(
    width: screenWidth,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: isRtl
          ? const BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            )
          : const BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
    ),
    child: ClipRRect(
      borderRadius: isRtl
          ? const BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            )
          : const BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
      child: Stack(
        children: [
          CustomPaint(
              painter: DrawerDesign(isLTR: !isRtl, color: color),
              child: Container()),
          _closeButton(context, isRtl),
          _inColorMenu(
            context,
            screenWidth,
            screenHeight,
            buttonsTextSize,
            name,
            profileImage,
            isRtl,
            buttons,
            contactUsScreen,
            appBar,
            contactsScreenButtomBackground,
            contactsScreenDialogColor,
            playStore,
            appStore,
            shareButton,
            reviewButton,
            tempLanguageCode,
            menuButtonColor,
            menuButtonEnableColor,
          ),
          if (appDetails != null)
            _outColorInfo(context, isRtl, screenHeight, appDetails),
        ],
      ),
    ),
  );
}

Widget _inColorMenu(
  BuildContext context,
  double screenWidth,
  double screenHeight,
  double? buttonsTextSize,
  String name,
  String? profileImage,
  bool isRtl,
  List<DrawerButtonModel>? buttons,
  Widget? contactUsScreen,
  PreferredSizeWidget appBar,
  Color contactsScreenButtomBackground,
  Color contactsScreenDialogColor,
  String? playStore,
  String? appStore,
  bool? shareButton,
  bool? reviewButton,
  ContactusTransalte? languageCode,
  Color? menuButtonColor,
  Color? menuButtonEnableColor,
) {
  final buttonsList = _buildDrawerButtons(
      context, screenWidth, buttonsTextSize, isRtl, buttons);
  final bottomButtonsList = _buildBottomButtons(
    context,
    screenWidth,
    isRtl,
    contactUsScreen,
    appBar,
    contactsScreenButtomBackground,
    contactsScreenDialogColor,
    buttonsTextSize,
    playStore,
    appStore,
    shareButton,
    reviewButton,
    languageCode,
    menuButtonColor,
    menuButtonEnableColor,
  );

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: SizedBox(
      height: screenHeight * 0.8,
      width: screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 60),
              _title(context, screenWidth, name, profileImage),
              ListView.separated(
                shrinkWrap: true,
                itemCount: buttonsList.length,
                itemBuilder: (context, index) => buttonsList[index],
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 30),
              ),
            ],
          ),
          Column(
            children: [
              kheasydevDivider(),
              ListView.separated(
                shrinkWrap: true,
                itemCount: bottomButtonsList.length,
                itemBuilder: (context, index) => bottomButtonsList[index],
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

List<Widget> _buildDrawerButtons(BuildContext context, double screenWidth,
    double? buttonsTextSize, bool isRtl, List<DrawerButtonModel>? buttons) {
  return buttons?.map((button) {
        return _buttons(
          context,
          screenWidth,
          buttonsTextSize,
          icon: button.icon.icon!,
          text: button.text,
          enableColor: button.enableColor,
          enableColorChoose: button.enableColorChoose,
          textIconColor: button.textIconColor,
          isRtl: isRtl,
          onTap: button.onTap ??
              () => KheasydevNavigatePage()
                  .push(context, button.page ?? kheasydevAppToast("error")),
        );
      }).toList() ??
      [];
}

List<Widget> _buildBottomButtons(
  BuildContext context,
  double screenWidth,
  bool isRtl,
  Widget? contactUsScreen,
  PreferredSizeWidget appBar,
  Color contactsScreenButtomBackground,
  Color contactsScreenDialogColor,
  double? buttonsTextSize,
  String? playStore,
  String? appStore,
  bool? shareButton,
  bool? reviewButton,
  ContactusTransalte? languageCode,
  Color? menuButtonColor,
  Color? menuButtonEnableColor,
) {
  final List<DrawerButtonModel> bottomList = _getBottomList(
    contactUsScreen,
    appBar,
    contactsScreenButtomBackground,
    contactsScreenDialogColor,
    playStore,
    appStore,
    shareButton,
    reviewButton,
    menuButtonColor,
    menuButtonEnableColor,
    languageCode,
  );
  return bottomList.map((button) {
    return _buttons(
      context,
      screenWidth,
      buttonsTextSize,
      icon: button.icon.icon!,
      text: button.text,
      enableColor: button.enableColor,
      enableColorChoose: button.enableColorChoose,
      textIconColor: button.textIconColor,
      isRtl: isRtl,
      onTap: () =>
          button.onTap ??
          KheasydevNavigatePage()
              .push(context, button.page ?? kheasydevAppToast("error")),
    );
  }).toList();
}

Positioned _closeButton(BuildContext context, bool isRtl) {
  return Positioned(
    left: isRtl ? 10 : null,
    right: !isRtl ? 10 : null,
    top: 30,
    child: IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(
        Icons.cancel_outlined,
        color: Colors.white,
        size: 24,
      ),
    ),
  );
}

Widget _buttons(
    BuildContext context, double screenWidth, double? buttonsTextSize,
    {required IconData icon,
    required String text,
    required bool isRtl,
    required enableColor,
    bool bottomButtons = false,
    Color? textIconColor,
    Color? enableColorChoose,
    VoidCallback? onTap}) {
  final iconTextColor = enableColor
      ? textIconColor ?? Colors.white
      : enableColorChoose ?? Colors.grey[300];
  return Padding(
    padding: EdgeInsets.only(
      right: isRtl ? screenWidth * 0.05 : 0,
      left: !isRtl ? screenWidth * 0.05 : 0,
    ),
    child: GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: iconTextColor,
            size: bottomButtons ? 20 : 24,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              color: iconTextColor,
              fontSize: bottomButtons
                  ? ((buttonsTextSize ?? 16) - 4)
                  : (buttonsTextSize ?? 16),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _title(BuildContext context, double screenWidth, String name,
    String? profileImage) {
  return Column(
    children: [
      Row(
        children: [
          if (profileImage != null)
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: ClipOval(
                child: Image.network(
                  profileImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          const SizedBox(width: 24),
          Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      const SizedBox(height: 12),
      kheasydevDivider(),
    ],
  );
}

Widget _outColorInfo(BuildContext context, bool isRtl, double screenHeight,
    (String, String) appDetails) {
  return Positioned(
    left: isRtl ? 10 : null,
    right: !isRtl ? 10 : null,
    bottom: screenHeight * 0.05,
    child: Text(
      "${appDetails.$1}\nv${appDetails.$2}",
      textAlign: TextAlign.left,
    ),
  );
}

List<DrawerButtonModel> _getBottomList(
        Widget? contactUsScreen,
        PreferredSizeWidget appBar,
        Color contactsScreenButtomBackground,
        Color contactsScreenDialogColor,
        String? playStore,
        String? appStore,
        bool? shareButton,
        bool? reviewButton,
        Color? menuButtonColor,
        Color? menuButtonEnableColor,
        ContactusTransalte? languageCode) =>
    [
      DrawerButtonModel(
        text: translateText(ContactusGetTranslate.contactUs, languageCode),
        icon: const Icon(Icons.contact_page),
        enableColor: true,
        enableColorChoose: menuButtonEnableColor,
        textIconColor: menuButtonColor,
        page: contactUsScreen ??
            ContactUsScreen(
              appBar: appBar,
              buttomBackground: contactsScreenButtomBackground,
              dialogColor: contactsScreenDialogColor,
              languageCode: languageCode,
            ),
      ),
      if (shareButton != false)
        DrawerButtonModel(
          text: translateText(ContactusGetTranslate.shareApp, languageCode),
          icon: const Icon(Icons.share),
          enableColor: true,
          onTap: () {
            if (!kIsWeb) {
              Share.share(
                  _getByPlatform(playStore: playStore, appStore: appStore));
            } else {
              //TODO: web open site
              kheasydevAppToast('שיתוף לאתר בקרוב');
            }
          },
        ),
      if (reviewButton != false)
        DrawerButtonModel(
          text: translateText(ContactusGetTranslate.rateApp, languageCode),
          icon: const Icon(Icons.rate_review),
          enableColor: true,
          onTap: () async {
            if (await inAppReview.isAvailable()) {
              inAppReview.requestReview();
            }
          },
        ),
    ];

String _getByPlatform({String? playStore, String? appStore}) {
  if (Platform.isAndroid) {
    return playStore ?? 'android';
  } else if (Platform.isIOS) {
    return appStore ?? 'ios';
  } else if (Platform.isMacOS) {
    return 'macOs';
  }
  return 'null';
}
