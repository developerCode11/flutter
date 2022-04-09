import 'package:get/get.dart';
import 'package:jeevam_redesign/app/modules/upload_reports/successfully_upload_documents_screen.dart';
import 'package:jeevam_redesign/app/modules/upload_reports/upload_documents_screen.dart';
import 'package:jeevam_redesign/app/modules/upload_reports/upload_progress_screen.dart';
import '../modules/splash/splash_screen.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const SplashScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.uploadDocumentsScreen,
      page: () =>  UploadDocumentsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.uploadProgressScreen,
      page: () =>  UploadProgressScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.successfullyUploadDocumentsScreen,
      page: () =>  SuccessFullyUploadDocumentsScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
