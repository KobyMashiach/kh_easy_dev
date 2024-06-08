part of kh_easy_dev;

final InAppReview inAppReview = InAppReview.instance;

//todo: change share and review

class KheasydevSideMenu extends StatelessWidget {
  const KheasydevSideMenu(
      {super.key,
      required this.selectedIndex,
      required this.shadowColor,
      required this.disableColor,
      this.playStore,
      this.appStore,
      this.sidebarItems,
      this.shareButton,
      this.reviewButton,
      this.contactUsScreen,
      required this.buttomBackground,
      required this.appBar});

  final int selectedIndex;
  final Color shadowColor;
  final Color disableColor;
  final String? playStore;
  final String? appStore;
  final List<SideBarModel>? sidebarItems;
  final PreferredSizeWidget appBar;
  final Color buttomBackground;
  final Widget? contactUsScreen;
  final bool? shareButton;
  final bool? reviewButton;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAppDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const CircularProgressIndicator();
          } else {
            return SidebarX(
              controller: SidebarXController(selectedIndex: selectedIndex),
              extendIcon: Icons.arrow_forward,
              collapseIcon: Icons.arrow_back,
              theme: SidebarXTheme(
                itemTextPadding: const EdgeInsets.only(right: 10),
                selectedItemTextPadding: const EdgeInsets.only(right: 10),
                selectedIconTheme: IconThemeData(color: shadowColor),
                selectedTextStyle: TextStyle(color: shadowColor),
                textStyle: TextStyle(color: disableColor),
                iconTheme: IconThemeData(color: disableColor),
                margin: const EdgeInsets.only(top: 100),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
              ),
              extendedTheme: SidebarXTheme(
                  margin: const EdgeInsets.only(top: 100),
                  width: MediaQuery.of(context).size.width * 0.5),
              headerBuilder: (context, extended) {
                return SizedBox(
                  // height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 0, right: 16, left: 16),
                    child: Column(
                      children: [
                        Image.asset('assets/logo.png', width: 100),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            snapshot.data?.$1 ?? "",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(color: shadowColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            snapshot.data?.$2 ?? "",
                            style: TextStyle(fontSize: 8, color: shadowColor),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              // headerDivider: const Divider(color: Colors.white),
              headerDivider: kheasydevDivider(),
              footerItems: [
                // SidebarXItem(icon: Icons.group, label: 'המוצרים שלנו', onTap: () {}),
                SidebarXItem(
                  icon: Icons.contact_page,
                  label: 'יצירת קשר',
                  onTap: () {
                    KheasydevNavigatePage().push(
                        context,
                        contactUsScreen ??
                            ContactUsScreen(
                              appBar: appBar,
                              buttomBackground: buttomBackground,
                              key: key,
                            ));
                  },
                ),
                SidebarXItem(
                    icon: Icons.share,
                    label: 'שיתוף האפליקציה',
                    onTap: () {
                      if (!kIsWeb) {
                        Share.share(getByPlatform(
                            appStore: appStore, playStore: playStore));
                      } else {
                        //TODO: web open site
                        kheasydevAppToast('שיתוף לאתר בקרוב');
                      }
                    }),
                if (reviewButton != false)
                  SidebarXItem(
                      icon: Icons.rate_review,
                      label: 'דרג',
                      onTap: () async {
                        if (await inAppReview.isAvailable()) {
                          // inAppReview.openStoreListing();
                          inAppReview.requestReview();
                        }
                      }),
              ],
              items:
                  sidebarItems != null ? sidebarItemsToList(sidebarItems!) : [],
            );
          }
        });
  }

  String getByPlatform({String? playStore, String? appStore}) {
    if (Platform.isAndroid) {
      return playStore ?? 'android';
    } else if (Platform.isIOS) {
      return appStore ?? 'ios';
    } else if (Platform.isMacOS) {
      return 'macOs';
    }
    return 'null';
  }

  Future<(String, String)> getAppDetails() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String name = packageInfo.appName;
    String version = packageInfo.version;
    return (name, version);
  }

  List<SidebarXItem> sidebarItemsToList(List<SideBarModel> sidebarItems) {
    List<SidebarXItem> items = [];
    for (var element in sidebarItems) {
      items.add(SidebarXItem(
        icon: element.icon,
        label: element.label,
        onTap: element.onTap,
      ));
    }
    return items;
  }
}
