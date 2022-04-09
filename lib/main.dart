import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jeevam_redesign/app/routes/app_pages.dart';
import 'package:jeevam_redesign/schemata/color_schema.dart';
import 'package:jeevam_redesign/app/modules/upload_reports/upload_documents_screen.dart';
import 'helper/utils/common_functions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      // statusBarColor: Colors.white, // this one for android
      statusBarBrightness: Brightness.light, // this one for iOS
      statusBarColor: Colors.transparent));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      navigatorKey: key,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      home: UploadDocumentsScreen(),
      // home: const SplashScreen(),
      theme: ThemeData(
        primaryColor: ColorSchema.primaryColor,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: ColorSchema.primaryColor),
        fontFamily: "Roboto",
      ),
      themeMode: ThemeMode.light,
      defaultTransition: Transition.topLevel,
      getPages: AppPages.pages,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
