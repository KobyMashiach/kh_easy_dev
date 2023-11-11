part of kh_easy_dev;

final InAppReview inAppReview = InAppReview.instance;

class KheasydevSideMenu extends StatelessWidget {
  const KheasydevSideMenu(
      {super.key,
      required this.appName,
      required this.selectedIndex,
      required this.shadowColor,
      required this.disableColor,
      this.playStore,
      this.appStore,
      this.sidebarItems});

  final String appName;
  final int selectedIndex;
  final Color shadowColor;
  final Color disableColor;
  final String? playStore;
  final String? appStore;
  final List<SideBarModel>? sidebarItems;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAppVersion(),
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
                        Text(appName, textAlign: TextAlign.center),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            snapshot.data ?? "",
                            style: const TextStyle(fontSize: 8),
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
                const SidebarXItem(
                  icon: Icons.contact_page,
                  label: 'יצירת קשר',
                  // onTap: () {
                  //   NavigatePage()
                  //       .pushAndRemoveUntil(context, const ContactUsScreen());
                  // },
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

  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return version;
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
