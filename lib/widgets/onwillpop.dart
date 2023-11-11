part of kh_easy_dev;

Future<bool> onWillPop(BuildContext context) async {
  return (await showDialog(
        context: context,
        builder: (context) => EasyNewsDialog(
          title: 'לצאת מהאפליקציה?',
          description: 'האם את/ה בטוח/ה רוצה לצאת מהאפליקציה?',
          isDismissable: false,
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
