import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/theme_controller.dart';
import 'core/constant/themes.dart';
import 'initial_bindings.dart';
import 'core/localization/change_local.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.intialLanguage,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      getPages: routes,
      initialBinding: InitialBindings(),
    );
  }
}
