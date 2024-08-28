Map<String, String> heContactusTranslate = {
  "call": " שיחה",
  "message": "הודעה",
  "whatsapp": "וואטסאפ",
  "website": "אתר אינטרנט",
  "phone": "טלפון",
  "email": "אימייל",
  "facebook": "פייסבוק",
  "instegram": "אינסטגרם",
  "tiktok": "טיקטוק"
};

Map<String, String> enContactusTranslate = {
  "dialog_title": "Choose a Contact Method",
  "call": "Call",
  "message": "Message",
  "whatsapp": "WhatsApp",
  "website": "Website",
  "phone": "Phone",
  "email": "Email",
  "facebook": "Facebook",
  "instegram": "Instagram",
  "tiktok": "TikTok"
};

Map<String, String> ruContactusTranslate = {
  "dialog_title": "Выберите способ связи",
  "call": "Звонок",
  "message": "Сообщение",
  "whatsapp": "WhatsApp",
  "website": "Вебсайт",
  "phone": "Телефон",
  "email": "Электронная почта",
  "facebook": "Фейсбук",
  "instegram": "Инстаграм",
  "tiktok": "ТикТок"
};

Map<String, String> arContactusTranslate = {
  "dialog_title": "اختر وسيلة اتصال",
  "call": "مكالمة",
  "message": "رسالة",
  "whatsapp": "واتساب",
  "website": "موقع ويب",
  "phone": "هاتف",
  "email": "البريد الإلكتروني",
  "facebook": "فيسبوك",
  "instegram": "إنستغرام",
  "tiktok": "تيك توك"
};

Map<String, String> frContactusTranslate = {
  "dialog_title": "Choisir une méthode de contact",
  "call": "Appel",
  "message": "Message",
  "whatsapp": "WhatsApp",
  "website": "Site web",
  "phone": "Téléphone",
  "email": "Email",
  "facebook": "Facebook",
  "instegram": "Instagram",
  "tiktok": "TikTok"
};

Map<String, String> getContactUsMap(ContactusTransalte? languageCode) {
  return switch (languageCode) {
    ContactusTransalte.he => heContactusTranslate,
    ContactusTransalte.en => enContactusTranslate,
    ContactusTransalte.ru => ruContactusTranslate,
    ContactusTransalte.ar => arContactusTranslate,
    ContactusTransalte.fr => frContactusTranslate,
    _ => heContactusTranslate
  };
}

enum ContactusTransalte { he, en, ru, ar, fr }

enum ContactusGetTranslate {
  dialogTitle,
  call,
  message,
  whatsapp,
  website,
  phone,
  email,
  facebook,
  instegram,
  tiktok
}

String translateText(
    ContactusGetTranslate key, ContactusTransalte? languageCode) {
  Map<String, String> translationsMap = getContactUsMap(languageCode);
  String keyString = key.toString().split('.').last;
  return translationsMap[keyString] ?? '';
}
