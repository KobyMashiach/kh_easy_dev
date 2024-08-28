Map<String, String> heContactusTranslate = {
  "contact_us": "יצירת קשר",
  "share_app": "שיתוף האפליקציה",
  "rate_app": "דרג את האפליקציה",
  "dialog_title": "בחר דרך התקשרות",
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
  "contact_us": "Contact Us",
  "share_app": "Sharing the app",
  "rate_app": "Rate the app",
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
  "contact_us": "Свяжитесь с нами",
  "share_app": "Поделиться приложением",
  "rate_app": "Оценить приложение",
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
  "contact_us": "اتصل بنا",
  "share_app": "مشاركة التطبيق",
  "rate_app": "قيم التطبيق",
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
  "contact_us": "Contactez-nous",
  "share_app": "Partager l'application",
  "rate_app": "Évaluer l'application",
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
