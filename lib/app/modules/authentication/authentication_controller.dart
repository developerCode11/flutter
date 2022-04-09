import 'package:get/get.dart';
import 'package:jeevam_redesign/app/modules/authentication/auth_provider.dart';


class AuthenticationController extends GetxController {
  final authProvider = Get.put(AuthProvider());

  @override
  void onInit() {
    super.onInit();
  
  }
}
