import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vms_employee_flutter/app/data/common.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  "High importance notification",
  description: "This channel is for important notifications",
  importance: Importance.max,
  playSound: true,
  enableLights: true,
  sound: RawResourceAndroidNotificationSound('ring_sound'),
  ledColor: Colors.yellow,
);

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? androidNotification = message.notification?.android;
    if (notification != null && androidNotification != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            color: Colors.blue,
            playSound: true,
            icon: '@mipmap/ic_launcher',
          ),
        ),
      );
    }
  });
  log('Handling a background message ${message.messageId}');
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  handleFcmNotifications();
  addInterceptors();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kBlue,
          foregroundColor: kWhite,
        ),
        fontFamily: GoogleFonts.roboto(color: kWhite).fontFamily,
        appBarTheme: const AppBarTheme(
          color: kBlue,
          foregroundColor: kWhite,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: kWhite,
            fontSize: 20,
          ),
        ),
        scaffoldBackgroundColor: kLightBlue,
        colorScheme: ColorScheme(
          primary: kWhite,
          primaryVariant: kWhite,
          secondary: kLightBlue!,
          secondaryVariant: kBlue,
          surface: kLightBlue!,
          background: kLightBlue!,
          error: kRed,
          onPrimary: kGrey,
          onSecondary: kGrey,
          onSurface: kGrey,
          onBackground: kGrey,
          onError: kRed,
          brightness: Brightness.light,
        ),
      ),
    );
  }
}

void handleFcmNotifications() async {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}

void addInterceptors() async {
  const storage = FlutterSecureStorage();
  dioClient.interceptors.add(
    InterceptorsWrapper(
      onRequest: (request, handler) async {
        var token = await storage.read(key: "authToken");
        log(token ?? '', name: "token");
        if (token != null && token != '') {
          request.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(request);
      },
      onError: (e, handler) async {
        if (e.response?.statusCode == 401) {
          //get new tokens ...
          String? token =
              await FirebaseAuth.instance.currentUser?.getIdToken(true);
          //set bearer
          storage.write(key: "authToken", value: token);
          e.requestOptions.headers["Authorization"] = "Bearer $token";
          //create request with new access token
          final opts = Options(
            method: e.requestOptions.method,
            headers: e.requestOptions.headers,
          );
          final cloneReq = await dioClient.request(e.requestOptions.path,
              options: opts,
              data: e.requestOptions.data,
              queryParameters: e.requestOptions.queryParameters);

          return handler.resolve(cloneReq);
        }
      },
    ),
  );
}
