Map<String, String> heContactusTranslate = {
  "contactUs": "יצירת קשר",
  "shareApp": "שיתוף האפליקציה",
  "rateApp": "דרג את האפליקציה",
  "dialogTitle": "בחר דרך התקשרות",
  "call": "שיחה",
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
  "contactUs": "Contact Us",
  "shareApp": "Sharing the app",
  "rateApp": "Rate the app",
  "dialogTitle": "Choose a Contact Method",
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
  "contactUs": "Свяжитесь с нами",
  "shareApp": "Поделиться приложением",
  "rateApp": "Оценить приложение",
  "dialogTitle": "Выберите способ связи",
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
  "contactUs": "اتصل بنا",
  "shareApp": "مشاركة التطبيق",
  "rateApp": "قيم التطبيق",
  "dialogTitle": "اختر وسيلة اتصال",
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
  "contactUs": "Contactez-nous",
  "shareApp": "Partager l'application",
  "rateApp": "Évaluer l'application",
  "dialogTitle": "Choisir une méthode de contact",
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

ContactusTransalte getlanguageCodeEnum(String? languageCode) {
  return switch (languageCode) {
    'he' => ContactusTransalte.he,
    'en' => ContactusTransalte.en,
    'ru' => ContactusTransalte.ru,
    'ar' => ContactusTransalte.ar,
    'fr' => ContactusTransalte.fr,
    _ => ContactusTransalte.he,
  };
}

enum ContactusTransalte { he, en, ru, ar, fr }

enum ContactusGetTranslate {
  contactUs,
  shareApp,
  rateApp,
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
