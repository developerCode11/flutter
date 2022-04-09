// // ignore_for_file: avoid_print

// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jhclinicapp/app/data/models/profile/profile_model.dart';
// import 'package:jhclinicapp/app/modules/bottomBar/bottombar_controller.dart';
// import 'package:jhclinicapp/app/modules/profile/profile_provider.dart';

// class ProfileController extends GetxController {
//   RxBool profileInfo = false.obs;
//   RxBool contactInfo = false.obs;
//   RxBool experience = false.obs;
//   Rx<File>? image = File("").obs;

//   Rx<forGender> enumforGender = Rx<forGender>((forGender.male));
//   final profileProvider = Get.put<ProfileProvider>(ProfileProvider());
//   late BottomBarController bottombarController;

//   final TextEditingController firstNameTextEditingController =
//       TextEditingController();
//   final TextEditingController lastNameTextEditingController =
//       TextEditingController();
//   final TextEditingController specializeTextEditingController =
//       TextEditingController();
//   final TextEditingController aboutMeTextEditingController =
//       TextEditingController();
//   final TextEditingController ageTextEditingController =
//       TextEditingController();
//   final TextEditingController languageTextEditingController =
//       TextEditingController();
//   final TextEditingController emailTextEditingController =
//       TextEditingController();
//   final TextEditingController numberTextEditingController =
//       TextEditingController();
//   final TextEditingController address1TextEditingController =
//       TextEditingController();
//   final TextEditingController address2TextEditingController =
//       TextEditingController();
//   final TextEditingController countryTextEditingController =
//       TextEditingController();
//   final TextEditingController stateTextEditingController =
//       TextEditingController();
//   final TextEditingController cityTextEditingController =
//       TextEditingController();
//   final TextEditingController pinCodeTextEditingController =
//       TextEditingController();

//   final FocusNode firstNameFocusNode = FocusNode();
//   final FocusNode lastNameFocusNode = FocusNode();
//   final FocusNode specializeFocusNode = FocusNode();
//   final FocusNode aboutMeFocusNode = FocusNode();
//   final FocusNode ageFocusNode = FocusNode();
//   final FocusNode languageFocusNode = FocusNode();
//   final FocusNode emailFocusNode = FocusNode();
//   final FocusNode numberFocusNode = FocusNode();
//   final FocusNode address1FocusNode = FocusNode();
//   final FocusNode address2FocusNode = FocusNode();
//   final FocusNode countryFocusNode = FocusNode();
//   final FocusNode stateFocusNode = FocusNode();
//   final FocusNode cityFocusNode = FocusNode();
//   final FocusNode pinCodeFocusNode = FocusNode();

//   Rx<DateTime> birthDate = DateTime.now().obs;

//   final Rx<ProfileModel> profileModel = ProfileModel().obs;

//   @override
//   void onInit() {
//     super.onInit();
//     apiCallForGetUserProfile();
//   }

//   apiCallForGetUserProfile() async {
//     try {
//       final response = await profileProvider.getUserProfile();
//       profileModel.value = ProfileModel.fromJson(response);
//       print(profileModel.toJson());
//       firstNameTextEditingController.text =
//           profileModel.value.profile?.basicInfo?.firstName ?? "";
//       lastNameTextEditingController.text =
//           profileModel.value.profile?.basicInfo?.lastName ?? "";
//       specializeTextEditingController.text =
//           profileModel.value.profile?.professionalInfo?.specialization?[0] ??
//               "";
//       aboutMeTextEditingController.text =
//           profileModel.value.profile?.basicInfo?.about ?? "";
//       ageTextEditingController.text = "36";
//       languageTextEditingController.text = "Russian, English, German";
//       emailTextEditingController.text =
//           profileModel.value.profile?.user?.email ?? "";
//       numberTextEditingController.text =
//           profileModel.value.profile?.phoneNumber.toString().substring(4) ?? "";
//       address1TextEditingController.text = "14, Anand Bhuvan, 14 201,";
//       address2TextEditingController.text = "Anand Bhuvan Kataria Marg, Mahim";
//       countryTextEditingController.text = "India";
//       stateTextEditingController.text = "Maharashtra";
//       cityTextEditingController.text = "Mumbai";
//       pinCodeTextEditingController.text = "400016";
//       birthDate.value = DateTime.parse(
//           profileModel.value.profile!.basicInfo!.dateOfBirth.toString());
//       bottombarController = Get.put<BottomBarController>(BottomBarController());

//       bottombarController.getTokenApi();
//     } catch (e) {
//       print(e);
//     }
//   }

//   apicallForEditProfile() async {
//     getExperimce() {
//       List demo = [];
//       for (int i = 0;
//           i < profileModel.value.profile!.professionalInfo!.experience!.length;
//           i++) {
//         demo.add(profileModel.value.profile!.professionalInfo!.experience![i]
//             .toJson());
//       }
//       return demo;
//     }

//     getGender() {
//       if (forGender.male == enumforGender.value) {
//         return "Male";
//       } else if (forGender.female == enumforGender.value) {
//         return "Female";
//       } else {
//         return "Other";
//       }
//     }

//     Map<String, dynamic> reqData = {
//       "professionalInfo": {
//         "specialization": [specializeTextEditingController.text],
//         "expertise": profileModel.value.profile?.professionalInfo?.expertise,
//         "experience": getExperimce()
//       },
//       "basicInfo": {
//         "firstName": firstNameTextEditingController.text,
//         "lastName": lastNameTextEditingController.text,
//         "dateOfBirth": birthDate.toString(),
//         "gender": getGender(),
//         "phoneNumber": numberTextEditingController.text,
//         "about": aboutMeTextEditingController.text
//       },
//       "imageUrl":
//           "https://jh-prod-profile-image.s3.ap-south-1.amazonaws.com/Coach_Urvi--1632396460662.jpg",
//       "phoneNumber": numberTextEditingController.text
//     };

//     try {
//       final response =
//           await profileProvider.patchUserProfile(req: json.encode(reqData));
//       print(response);
//       profileModel.value = ProfileModel.fromJson(response);

//       Get.back();
//       Get.snackbar(
//         "Success",
//         response['message'],
//       );
//     } catch (e) {
//       print(e);
//     }
//   }
// }

// enum forGender { male, female, other }
