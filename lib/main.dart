import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/pages/splash/splash_screen.dart';
import 'package:app_mobile/routes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
        appBarTheme: AppBarTheme(
          backgroundColor: kWhiteColors,
          elevation: 0,
        ),
        primarySwatch: Colors.orange,
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.black),
          hintStyle: TextStyle(color: Colors.grey),
        )
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
      home: SplashScreen(),
    );
  }
}
