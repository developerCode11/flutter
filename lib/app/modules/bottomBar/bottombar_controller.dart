// // ignore_for_file: empty_catches, avoid_print

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:jhclinicapp/app/data/controllers/notificaion_controller.dart';
// import 'package:jhclinicapp/app/data/services/api_service/api_service.dart';
// import 'package:jhclinicapp/app/modules/chat/chat_user_list.dart';
// import 'package:jhclinicapp/app/modules/profile/profile_controller.dart';
// import 'package:jhclinicapp/helper/utils/common_functions.dart';
// import 'package:jhclinicapp/helper/utils/constants.dart';
// import 'package:stream_chat_flutter/stream_chat_flutter.dart' as chat;
// import 'package:stream_chat_flutter/stream_chat_flutter.dart';

// class BottomBarController extends GetxController {
//   List<Channel> channels = [];
//   List<String> listForSearching = <String>[];
//   Message? quotedMessage;

//   final profileController = Get.put<ProfileController>(ProfileController());
//   late NotificaionController notificaionController;
//   final TextEditingController searchTextFieldController =
//       TextEditingController();
//   final searchFocusNode = FocusNode();
//   getTokenApi() {
//     FirebaseMessaging.instance.getToken().then(
//       (token) async {
//         try {
//           bool isTokenRefreshed = false;
//           FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
//             isTokenRefreshed = true;
//             registerToChat(newToken);
//           });
//           if (!isTokenRefreshed) {
//             registerToChat(token!);
//           }
//         } catch (e) {}

//         // try {
//         //   final response = await ApiService.postRequest(
//         //       ApiConstants.fcmRegisterToken,
//         //       body: jsonEncode({"fcmRegistrationToken": token}));
//         //   print(response);
//         // } catch (e) {
//         //   print(e);
//         // }
//       },
//     );
//   }

//   registerToChat(String token) async {
//     print("FCM TOKEN ==> " + token);
//     try {
//       String accessToken = '', chatUserId = '';
//       try {
//         final response = await ApiService.getRequest(
//           ApiConstants.getChatUserId +
//               GetStorage().read("userDetails")['userId'],
//         );
//         accessToken = response['accessToken'];
//         chatUserId = response['chatUserId'];
//       } catch (e) {
//         print(e);
//       }

//       bool isNameAvailable = true;
//       String name = "";
//       final imgUrl =
//           profileController.profileModel.value.profile?.imageUrl ?? "";
//       name =
//           profileController.profileModel.value.profile?.basicInfo?.firstName ??
//               "";
//       if (name.isEmpty) {
//         isNameAvailable = false;
//         name = profileController.profileModel.value.profile?.sId ?? "";
//       }
//       if (client.wsConnectionStatus == ConnectionStatus.disconnected) {
//         await client.connectUser(
//           chat.User(id: chatUserId, extraData: {
//             'name': name,
//             'image': imgUrl,
//             'isNameAvailable': isNameAvailable
//           }),
//           accessToken,
//         );
//         channels = await client
//             .queryChannels(
//               filter: Filter.raw(
//                 value: {
//                   'members': {
//                     // ignore: deprecated_member_use
//                     '\$in': [client.state.user!.id],
//                   }
//                 },
//               ),
//               paginationParams: const PaginationParams(),
//             )
//             .first;
//       }

//       print(channels[1].cid);
//       await client.addDevice(token, PushProvider.firebase);
//       update();
//       notificaionController =
//           Get.put<NotificaionController>(NotificaionController());
//       await notificaionController.intializeFirebase();
//       print("After all initilize ==============> ");
//     } catch (e) {}
//   }

//   searchingMember({String? val}) async {
//     listForSearching.clear();
//     if (!isNullEmptyOrFalse(val!.trim())) {
//       // bottomBarController.searchingMember(val: val);
//       // final userId = StreamChat.of(Get.context!).currentUser?.id;
//       // Member? otherMember;

//       // Iterable<chat.Channel> demo =
//       //     client.state.channels.values.where((element) {
//       //   if (element.name == null) {
//       //     return false;
//       //   }

//       //   return element.name!.toLowerCase().startsWith(val) ||
//       //       element.name!.toLowerCase().contains(val.toLowerCase());
//       // }).toList();

//       // Iterable<chat.Channel> demo = client.state.channels.values
//       //     .where(
//       //       (element) =>
//       //           // element.name!.toLowerCase().startsWith(val) ||
//       //           (element.name ?? "").toLowerCase().contains(val.toLowerCase()),
//       //     )
//       //     .toList();

//       for (var element in client.state.channels.values) {
//         print(element.name);
//         if ((element.name ?? "").toLowerCase().contains(val.toLowerCase())) {
//           listForSearching.add(element.id!.replaceFirst("ch_", ""));
//         }
//       }
//       // client.state.channels.forEach((key, value) {
//       //   // for (int i = 0; i < value.state!.members.length; i++) {

//       //   // otherMember = value.state!.members.firstWhereOrNull(
//       //   //   (element) => element.userId != userId,
//       //   // );
//       //   if (!isNullEmptyOrFalse(value.name ?? "")) {
//       //     if (value.name!
//       //         .toLowerCase()
//       //         .isCaseInsensitiveContains(val.toLowerCase())) {
//       //       listForSearching.add(value.id!.replaceFirst("ch_", ""));
//       //     }
//       //   }
//       // });
//       print("daddwawd ${listForSearching.length}");
//       update();
//     }
//     update();
//   }

//   //show chat api calling.
//   // Future<void> showChat() async {
//   //   try {
//   //     String accessToken = '', chatUserId = '';
//   //     await NetworkClient.getInstance.makeApiCall(
//   //       ApiConstants.getChatUserId + UserModel.getInstance.loginResponse.userId,
//   //       MethodType.Get,
//   //       successCallback: (k1, k2) {
//   //         accessToken = k1['accessToken'];
//   //         chatUserId = k1['chatUserId'];
//   //       },
//   //       failureCallback: (statusCode, message, isverify) {},
//   //     );
//   //     if ([chat.ConnectionStatus.connected, chat.ConnectionStatus.connecting]
//   //         .contains(client.wsConnectionStatus)) {
//   //       await client.disconnectUser();
//   //     }
//   //     patientProfile.Info info =
//   //         SaveUserProfileModel.getInstance.profileModel.patientProfile.info;
//   //     bool isNameAvailable = true;
//   //     String name = "${info?.firstName ?? ''} ${info?.lastName ?? ''}".trim(),
//   //         imgUrl = SaveUserProfileModel.getInstance.profileModel.imageUrl;
//   //     if (name.isEmpty) {
//   //       isNameAvailable = false;
//   //       // name = SaveUserProfileModel.getInstance.profileModel.patientId;
//   //     }
//   //     await client.connectUser(
//   //       chat.User(id: chatUserId, extraData: {
//   //         'name': name,
//   //         'image': imgUrl,
//   //         'isNameAvailable': isNameAvailable
//   //       }),
//   //       accessToken,
//   //     );
//   //   } catch (e) {
//   //     showToast(msg: 'Something went wrong. Please try again!');
//   //   }
//   // }
//   @override
//   void onInit() {
//     super.onInit();
//     getTokenApi();
//   }
// }
