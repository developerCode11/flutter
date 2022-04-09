// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:jhclinicapp/app/data/services/api_service/api_service.dart';
// import 'package:jhclinicapp/helper/utils/common_functions.dart';
// import 'package:jhclinicapp/helper/utils/constants.dart';

// class ProfileProvider extends GetxService {
//   getUserProfile() async {
//     final result = await ApiService.getRequest(
//         "${ApiConstants.profileUrl}${getUserRole()}/${GetStorage().read("userDetails")['userId']}");
//     return result;
//   }

//   patchUserProfile({Object? req}) async {
//     final result = await ApiService.postRequest(
//         "${ApiConstants.profileUrl}${getUserRole()}/${GetStorage().read("userDetails")['userId']}",
//         body: req);

//     return result;
//   }
// }
// a