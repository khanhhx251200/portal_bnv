import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/providers/auth_provider/sign_up_provider.dart';
import 'package:app_mobile/core/providers/document_provider.dart';
import 'package:app_mobile/core/providers/file_provider.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/provider/document_and_file_provider.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/view_file/components/view_file_provider.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/components/phieu_yeu_cau_provider.dart';
import 'package:app_mobile/pages/splash/splash_screen.dart';
import 'package:app_mobile/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseMessaging messaging;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

AndroidNotificationChannel channel;
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();

  await Firebase.initializeApp();

  Hive.init(appDocumentDirectory.path);

  messaging = FirebaseMessaging.instance;

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FileProvider()),
    ChangeNotifierProvider(create: (_) => DocumentProvider()),
    ChangeNotifierProvider(create: (_) => FolderAndFileProvider()),
    ChangeNotifierProvider(create: (_) => SignUpProvider()),
    ChangeNotifierProvider(create: (_) => ViewFileProvider()),
    ChangeNotifierProvider(create: (_) => PhieuYeuCauProvider()),
  ], child: MyApp()));

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
          )),
      initialRoute: SplashScreen.routeName,
      routes: routes,
      home: SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}
