part of kh_easy_dev;

class ContactUs extends StatelessWidget {
  final ImageProvider? logo;
  final String? phoneNumber;
  final String? website;
  final String email;
  final String? facebookHandle;
  final String? tiktokUrl;
  final String companyName;
  final String? instagram;
  final Color textColor;
  final Color? dialogColor;
  final List<CustomSocialField>? customSocials;

  const ContactUs({
    super.key,
    required this.companyName,
    required this.textColor,
    required this.email,
    this.logo,
    this.dialogColor,
    this.phoneNumber,
    this.website,
    this.facebookHandle,
    this.tiktokUrl,
    this.instagram,
    this.customSocials,
  });

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 8.0,
          contentPadding: const EdgeInsets.all(18.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => launchUrl(Uri.parse('tel:${phoneNumber!}')),
                child: Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: const Text('Call'),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () => launchUrl(Uri.parse('sms:${phoneNumber!}')),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: const Text('Message'),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  final url = Uri.parse(
                    'https://wa.me/${phoneNumber!.substring(
                      1,
                      phoneNumber!.length,
                    )}',
                  );
                  launchUrl(url, mode: LaunchMode.externalApplication);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: const Text('WhatsApp'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const EdgeInsets margin = EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 25.0,
    );
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 18),
            Visibility(
              visible: logo != null,
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: logo,
              ),
            ),

            Text(
              companyName,
              style: const TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Visibility(
            //   visible: tagLine != null,
            //   child: Text(
            //     tagLine ?? "",
            //     style: TextStyle(
            //       fontFamily: taglineFont ?? 'Pacifico',
            //       color: taglineColor,
            //       fontSize: 20.0,
            //       letterSpacing: 2.0,
            //       fontWeight: taglineFontWeight ?? FontWeight.bold,
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 10.0,
            ),
            kheasydevDivider(
              height: 2,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Visibility(
              visible: website != null,
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: margin,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: ListTile(
                  leading: const Icon(Typicons.link),
                  title: Text(
                    'אתר אינטרנט',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  onTap: () => launchUrl(Uri.parse(website!)),
                ),
              ),
            ),
            Visibility(
              visible: phoneNumber != null,
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: margin,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: ListTile(
                  leading: const Icon(Typicons.phone),
                  title: Text(
                    'טלפון',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => KheasydevDialog(
                      title: 'בחר דרך יצירת קשר',
                      primaryColor: dialogColor,
                      description: phoneNumber,
                      isDismissable: true,
                      buttons: [
                        GenericButtonModel(
                          text: "שיחה",
                          type: GenericButtonType.elevated,
                          onPressed: () {
                            launchUrl(Uri.parse('tel:${phoneNumber!}'));
                            KheasydevNavigatePage().pop(context);
                          },
                        ),
                        GenericButtonModel(
                          text: "הודעה",
                          type: GenericButtonType.elevated,
                          onPressed: () {
                            launchUrl(Uri.parse('sms:${phoneNumber!}'));
                            KheasydevNavigatePage().pop(context);
                          },
                        ),
                        GenericButtonModel(
                          text: "וואטסאפ",
                          type: GenericButtonType.elevated,
                          onPressed: () {
                            launchUrl(Uri.parse(
                                'https://api.whatsapp.com/send?phone=+972$phoneNumber&text=היי אשמח לעזרה'));
                            KheasydevNavigatePage().pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              margin: margin,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: ListTile(
                leading: const Icon(Typicons.mail),
                title: Text(
                  'אימייל',
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                onTap: () => launchUrl(Uri.parse('mailto:$email')),
              ),
            ),
            Visibility(
              visible: facebookHandle != null,
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: margin,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: ListTile(
                  leading: const Icon(Typicons.social_facebook),
                  title: Text(
                    'פייסבוק',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  onTap: () => launchUrl(
                      Uri.parse('https://www.facebook.com/${facebookHandle!}')),
                ),
              ),
            ),
            Visibility(
              visible: instagram != null,
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: margin,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: ListTile(
                  leading: const Icon(Typicons.social_instagram),
                  title: Text(
                    'אינסטגרם',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  onTap: () => launchUrl(
                      Uri.parse('https://instagram.com/${instagram!}')),
                ),
              ),
            ),

            Visibility(
              visible: tiktokUrl != null,
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: margin,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: ListTile(
                  leading: const Icon(Icons.tiktok),
                  title: Text(
                    'טיקטוק',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  onTap: () => launchUrl(
                      Uri.parse("https://www.tiktok.com/@${tiktokUrl!}")),
                ),
              ),
            ),
            ...(customSocials ?? []).map(
              (e) => Card(
                clipBehavior: Clip.antiAlias,
                margin: margin,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: ListTile(
                  leading: e.icon,
                  title: Text(
                    e.name,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  onTap: () => launchUrl(Uri.parse(e.url)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSocialField {
  final Icon icon;
  final String name;
  final String url;

  CustomSocialField({
    required this.icon,
    required this.name,
    required this.url,
  });
}
