part of kh_easy_dev;

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen(
      {super.key, required this.appBar, required this.buttomBackground});

  final PreferredSizeWidget appBar;
  final Color buttomBackground;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: appBar,
      body: ContactUs(
        textColor: buttomBackground,
        logo: const AssetImage('assets/logo.png'),
        email: 'easynews@gifture.co.il',
        companyName: 'K&H Easy Dev',
        phoneNumber: '055-3180148',
        website: 'https://www.gifture.co.il',
        instagram: 'gifture_il',
        facebookHandle: 'GIFTUREIL',
        tiktokUrl: "gifture_il",
      ),
    );
  }
}
