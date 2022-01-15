import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vms_employee_flutter/app/data/common.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
