import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "chooseLang": "اختر اللفة",
          "arabic": "العربية",
          "english": "الانجليزية"
        },
        "en": {
          "chooseLang": "Choose Language",
          "arabic": "Arabic",
          "english": "English",
        },
      };
}
