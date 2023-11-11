part of kh_easy_dev;

Future<bool> kheasydevOnWillPop(BuildContext context,
    {required Color primaryColor, required Color buttomBackground}) async {
  return (await showDialog(
        context: context,
        builder: (context) => KheasydevDialog(
          title: 'לצאת מהאפליקציה?',
          description: 'האם את/ה בטוח/ה רוצה לצאת מהאפליקציה?',
          isDismissable: false,
          primaryColor: primaryColor,
          buttomBackground: buttomBackground,
          buttons: [
            GenericButtonModel(
                text: "כן",
                type: GenericButtonType.elevated,
                onPressed: () {
                  Navigator.of(context).pop(true);
                }),
            GenericButtonModel(
                text: "לא",
                type: GenericButtonType.outlined,
                onPressed: () {
                  Navigator.of(context).pop(false);
                }),
          ],
        ),
      )) ??
      false;
}
