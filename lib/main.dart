import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'users/login.dart';
import 'localnotification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService().initNotification();
  await Firebase.initializeApp(); 
  runApp(SiPintarApp());
}

// ignore: must_be_immutable
class SiPintarApp extends StatelessWidget {
  SiPintarApp({super.key});

  MaterialColor mainAppColor = const MaterialColor(0xFF22355C, <int, Color>{
    50: Color(0xFF22355C),
    100: Color(0xFF22355C),
    200: Color(0xFF22355C),
    300: Color(0xFF22355C),
    400: Color(0xFF22355C),
    500: Color(0xFF22355C),
    600: Color(0xFF22355C),
    700: Color(0xFF22355C),
    800: Color(0xFF22355C),
    900: Color(0xFF22355C),
  });

  MaterialColor floatingColorLabelStyle =
      const MaterialColor(0xFF2946DA, <int, Color>{
    50: Color(0xFF22355C),
    100: Color(0xFF2946DA),
    200: Color(0xFF2946DA),
    300: Color(0xFF2946DA),
    400: Color(0xFF2946DA),
    500: Color(0xFF2946DA),
    600: Color(0xFF2946DA),
    700: Color(0xFF2946DA),
    800: Color(0xFF2946DA),
    900: Color(0xFF2946DA),
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SiPintar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: mainAppColor,
          fontFamily: 'Montserrat',
          inputDecorationTheme: InputDecorationTheme(
            floatingLabelStyle: TextStyle(
                color: floatingColorLabelStyle, fontWeight: FontWeight.bold), 
          ),
          textTheme: const TextTheme(
              titleMedium: TextStyle(color: Color(0xFF8CC7FE)))),
      home: const LoginPage(),
    );
  }
}
