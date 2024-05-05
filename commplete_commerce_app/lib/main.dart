
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/services/services.dart';
import 'core/constant/color.dart';
import 'view/screens/onboarding.dart';
import 'routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await intialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          background: AppColor.backgroundColor,
        ),
        textTheme: TextTheme(
          displayLarge:
              GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 22),
          bodyLarge: GoogleFonts.roboto(color: AppColor.grey, fontSize: 14),
          labelLarge:
              GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        useMaterial3: true,
      ),
      home: const OnBoardingScreen(),
      routes: routes,
    );
  }
}
