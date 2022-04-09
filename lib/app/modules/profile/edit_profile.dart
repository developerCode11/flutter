// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:jhclinicapp/app/modules/profile/profile_controller.dart';
// import 'package:jhclinicapp/components/common_textfield.dart';
// import 'package:jhclinicapp/helper/utils/images.dart';
// import 'package:jhclinicapp/schemata/color_schema.dart';
// import 'package:jhclinicapp/schemata/text_style.dart';
// // import 'package:jhclinicapp/schemata/text_style.dart';

// import '../../../helper/utils/common_functions.dart';

// class EditProfile extends StatelessWidget {
//   EditProfile({Key? key}) : super(key: key);
//   final profileController = Get.find<ProfileController>();
//   final ScrollController scrollController = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorSchema.whiteColor,
//       body: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus();
//         },
//         child: Padding(
//           padding: EdgeInsets.only(
//             left: 10,
//             right: 10,
//             top: MediaQuery.of(context).padding.top,
//           ),
//           child: Obx(
//             () => Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 10,
//                     right: 10,
//                   ),
//                   child: header(),
//                 ),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     physics: const BouncingScrollPhysics(),
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(
//                             left: 10,
//                             right: 10,
//                           ),
//                           child: Column(
//                             children: [
//                               profilePicWidget(),
//                               nameWidget(),
//                               specializeWidget(),
//                               aboutMeWidget(),
//                             ],
//                           ),
//                         ),
//                         generalInfoWidget(),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                             left: 10,
//                             right: 10,
//                           ),
//                           child: commonDivider(),
//                         ),
//                         contactInfoWidget(),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                             left: 10,
//                             right: 10,
//                           ),
//                           child: commonDivider(),
//                         ),
//                         experienceWidget(),
//                         const SizedBox(
//                           height: 30,
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Column nameWidget() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(
//             top: 12,
//           ),
//           child: Text(
//             "First name",
//             style: const TextStyle().errorText12.textColor(
//                   ColorSchema.black54Color,
//                 ),
//           ),
//         ),
//         SizedBox(
//           height: 35,
//           child: CommonTextfield(
//             contentPadding: const EdgeInsets.only(bottom: 15),
//             textOption: TextFieldOption(
//                 inputController:
//                     profileController.firstNameTextEditingController),
//             focusNode: profileController.firstNameFocusNode,
//             ontap: () {},
//             textCallback: (val) {},
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(
//             top: 12,
//           ),
//           child: Text(
//             "Last name",
//             style: const TextStyle().errorText12.textColor(
//                   ColorSchema.black54Color,
//                 ),
//           ),
//         ),
//         SizedBox(
//           height: 35,
//           child: CommonTextfield(
//             contentPadding: const EdgeInsets.only(bottom: 15),
//             textOption: TextFieldOption(
//                 inputController:
//                     profileController.lastNameTextEditingController),
//             focusNode: profileController.lastNameFocusNode,
//             ontap: () {},
//             textCallback: (val) {},
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//       ],
//     );
//   }

//   Column specializeWidget() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(
//             top: 12,
//           ),
//           child: Text(
//             "Specialize",
//             style: const TextStyle().errorText12.textColor(
//                   ColorSchema.black54Color,
//                 ),
//           ),
//         ),
//         SizedBox(
//           height: 35,
//           child: CommonTextfield(
//             contentPadding: const EdgeInsets.only(bottom: 15),
//             textOption: TextFieldOption(
//                 inputController:
//                     profileController.specializeTextEditingController),
//             focusNode: profileController.specializeFocusNode,
//             ontap: () {},
//             textCallback: (val) {},
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         )
//       ],
//     );
//   }

//   Column aboutMeWidget() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(
//             top: 12,
//             bottom: 5,
//           ),
//           child: Text(
//             "About Me",
//             style: const TextStyle().errorText12.textColor(
//                   ColorSchema.black54Color,
//                 ),
//           ),
//         ),
//         SizedBox(
//           // height: 40,
//           child: CommonTextfield(
//             contentPadding: const EdgeInsets.only(
//               bottom: 10,
//             ),
//             textOption: TextFieldOption(
//                 maxLine: 5,
//                 inputController:
//                     profileController.aboutMeTextEditingController),
//             focusNode: profileController.aboutMeFocusNode,
//             ontap: () {},
//             textCallback: (val) {},
//           ),
//         ),
//       ],
//     );
//   }

//   Column header() {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Get.back();
//               },
//               child: SvgPicture.asset(
//                 ImageConstants.backIcon,
//                 color: ColorSchema.blackColor,
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 profileController.apicallForEditProfile();
//               },
//               child: Container(
//                 padding: const EdgeInsets.only(
//                     left: 16, right: 16, top: 8, bottom: 8),
//                 decoration: BoxDecoration(
//                   color: ColorSchema.primaryColor,
//                   borderRadius: BorderRadius.circular(
//                     15,
//                   ),
//                 ),
//                 child: Text(
//                   "Save",
//                   style: const TextStyle().normal16.textColor(
//                         ColorSchema.whiteColor,
//                       ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 10,
//         )
//       ],
//     );
//   }

//   Widget profilePicWidget() {
//     return Center(
//       child: Container(
//         height: 150,
//         width: 150,
//         margin: const EdgeInsets.only(top: 25),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           image: getImageView(),
//         ),
//         child: Stack(
//           alignment: Alignment.bottomRight,
//           children: [
//             GestureDetector(
//               onTap: () async {
//                 showModalBottomSheet(
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   isScrollControlled: false,
//                   context: Get.context!,
//                   builder: (context) {
//                     return SizedBox(
//                       height: 190,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.only(top: 10),
//                             height: 5,
//                             width: 60,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(3),
//                                 color: ColorSchema.chatBackGround),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Spacer(),
//                               Column(
//                                 children: [
//                                   GestureDetector(
//                                     onTap: () async {
//                                       Get.back();
//                                       await ImagePicker()
//                                           .pickImage(source: ImageSource.camera)
//                                           .then((value) {
//                                         if (value != null) {
//                                           profileController.image?.value =
//                                               File(value.path);
//                                         }
//                                       });
//                                     },
//                                     child: Container(
//                                       margin: const EdgeInsets.only(
//                                           top: 40, bottom: 8),
//                                       padding: const EdgeInsets.all(24),
//                                       decoration: BoxDecoration(
//                                         color: ColorSchema.black10Color,
//                                         borderRadius: BorderRadius.circular(
//                                           16,
//                                         ),
//                                       ),
//                                       child: SvgPicture.asset(
//                                         ImageConstants.cameraIcon,
//                                         height: 32,
//                                         width: 32,
//                                       ),
//                                     ),
//                                   ),
//                                   Text(
//                                     "Camera",
//                                     style: const TextStyle().normal16.textColor(
//                                           ColorSchema.black54Color,
//                                         ),
//                                   )
//                                 ],
//                               ),
//                               const Spacer(),
//                               Column(
//                                 children: [
//                                   GestureDetector(
//                                     onTap: () async {
//                                       Get.back();

//                                       await ImagePicker()
//                                           .pickImage(
//                                               source: ImageSource.gallery)
//                                           .then((value) {
//                                         if (value != null) {
//                                           profileController.image?.value =
//                                               File(value.path);
//                                         }
//                                       });
//                                     },
//                                     child: Container(
//                                       margin: const EdgeInsets.only(
//                                           top: 40, bottom: 8),
//                                       padding: const EdgeInsets.all(24),
//                                       decoration: BoxDecoration(
//                                         color: ColorSchema.black10Color,
//                                         borderRadius: BorderRadius.circular(
//                                           16,
//                                         ),
//                                       ),
//                                       child: SvgPicture.asset(
//                                           ImageConstants.galleryIcon),
//                                     ),
//                                   ),
//                                   Text(
//                                     "Gallery",
//                                     style: const TextStyle().normal16.textColor(
//                                           ColorSchema.black54Color,
//                                         ),
//                                   )
//                                 ],
//                               ),
//                               const Spacer(),
//                               Column(
//                                 children: [
//                                   GestureDetector(
//                                     onTap: () async {
//                                       Get.back();
//                                     },
//                                     child: Container(
//                                       margin: const EdgeInsets.only(
//                                           top: 40, bottom: 8),
//                                       padding: const EdgeInsets.all(24),
//                                       decoration: BoxDecoration(
//                                         color: ColorSchema.black10Color,
//                                         borderRadius: BorderRadius.circular(
//                                           16,
//                                         ),
//                                       ),
//                                       child: SvgPicture.asset(
//                                           ImageConstants.removeIconIcon),
//                                     ),
//                                   ),
//                                   Text(
//                                     "Remove",
//                                     style: const TextStyle().normal16.textColor(
//                                           ColorSchema.black54Color,
//                                         ),
//                                   )
//                                 ],
//                               ),
//                               const Spacer(),
//                             ],
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//               child: Container(
//                 height: 40,
//                 width: 40,
//                 padding: const EdgeInsets.all(5),
//                 margin: const EdgeInsets.only(right: 8),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: ColorSchema.whiteColor, width: 4),
//                   shape: BoxShape.circle,
//                   color: ColorSchema.chatBackGround,
//                 ),
//                 child: SvgPicture.asset(
//                   ImageConstants.cameraIcon,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   generalInfoWidget() {
//     return AnimatedCrossFade(
//       firstChild: InkWell(
//         borderRadius: const BorderRadius.all(
//           Radius.circular(8),
//         ),
//         splashColor: Colors.transparent,
//         highlightColor: ColorSchema.greyColor,
//         onTap: () {
//           profileController.contactInfo.value = false;
//           profileController.experience.value = false;
//           profileController.profileInfo.value = true;
//         },
//         child: Padding(
//           padding:
//               const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SvgPicture.asset(
//                 ImageConstants.profileInfo,
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 "General Information",
//                 style: const TextStyle()
//                     .normal16
//                     .textColor(ColorSchema.blackColor),
//               ),
//               const Spacer(),
//               SvgPicture.asset(
//                 ImageConstants.arrowDown,
//               ),
//             ],
//           ),
//         ),
//       ),
//       secondChild: Column(
//         children: [
//           InkWell(
//             borderRadius: const BorderRadius.all(
//               Radius.circular(8),
//             ),
//             splashColor: Colors.transparent,
//             highlightColor: ColorSchema.greyColor,
//             onTap: () {
//               profileController.contactInfo.value = false;
//               profileController.experience.value = false;
//               profileController.profileInfo.value = false;
//             },
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 left: 10,
//                 right: 10,
//                 bottom: 15,
//                 top: 15,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SvgPicture.asset(
//                     ImageConstants.profileInfo,
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     "General Information",
//                     style: const TextStyle()
//                         .normal16
//                         .textColor(ColorSchema.blackColor),
//                   ),
//                   const Spacer(),
//                   SvgPicture.asset(
//                     ImageConstants.arrowUp,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(left: 10, right: 10, bottom: 16),
//             padding:
//                 const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
//             decoration: BoxDecoration(
//                 color: ColorSchema.profileCardBackGround,
//                 borderRadius: BorderRadius.circular(6),
//                 border: Border.all(
//                   color: ColorSchema.chatBackGround,
//                 )),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 birthDateWidget(),
//                 ageWidget(),
//                 genderWidget(),
//                 languageWidget()
//               ],
//             ),
//           ),
//         ],
//       ),
//       crossFadeState: profileController.profileInfo.value
//           ? CrossFadeState.showSecond
//           : CrossFadeState.showFirst,
//       duration: const Duration(
//         milliseconds: 200,
//       ),
//     );
//   }

//   DecorationImage getImageView() {
//     if (profileController.image?.value != null &&
//         profileController.image!.value.path.isNotEmpty) {
//       return DecorationImage(
//         image: FileImage(
//           profileController.image!.value,
//         ),
//         fit: BoxFit.cover,
//       );
//     } else if (profileController
//             .profileModel.value.profile?.imageUrl?.isNotEmpty ??
//         "".isNotEmpty) {
//       return DecorationImage(
//           fit: BoxFit.cover,
//           image: NetworkImage(
//             profileController.profileModel.value.profile?.imageUrl ?? "",
//           ));
//     } else {
//       return const DecorationImage(
//         image: AssetImage(
//           "assets/profileIcon/profileImage1.png",
//         ),
//         fit: BoxFit.cover,
//       );
//     }
//   }

//   Column languageWidget() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(
//             top: 12,
//           ),
//           child: Text(
//             "Referred Language",
//             style: const TextStyle().errorText12.textColor(
//                   ColorSchema.black54Color,
//                 ),
//           ),
//         ),
//         SizedBox(
//           height: 35,
//           child: CommonTextfield(
//             contentPadding: const EdgeInsets.only(bottom: 15),
//             textOption: TextFieldOption(
//                 inputController:
//                     profileController.languageTextEditingController),
//             focusNode: profileController.languageFocusNode,
//             ontap: () {},
//             textCallback: (val) {},
//           ),
//         ),
//       ],
//     );
//   }

//   Column genderWidget() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(
//             top: 12,
//           ),
//           child: Text(
//             "Gender",
//             style: const TextStyle().errorText12.textColor(
//                   ColorSchema.black54Color,
//                 ),
//           ),
//         ),
//         Row(
//           children: [
//             Radio<forGender>(
//                 materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                 value: forGender.male,
//                 groupValue: profileController.enumforGender.value,
//                 onChanged: (val) {
//                   profileController.enumforGender.value = val!;
//                 }),
//             Text(
//               "Male",
//               style: const TextStyle().normal16.textColor(
//                     (profileController.enumforGender.value == forGender.male)
//                         ? ColorSchema.blackColor
//                         : ColorSchema.black54Color,
//                   ),
//             ),
//             Radio<forGender>(
//                 value: forGender.female,
//                 groupValue: profileController.enumforGender.value,
//                 onChanged: (val) {
//                   profileController.enumforGender.value = val!;
//                 }),
//             Text(
//               "Female",
//               style: const TextStyle().normal16.textColor(
//                     (profileController.enumforGender.value == forGender.female)
//                         ? ColorSchema.blackColor
//                         : ColorSchema.black54Color,
//                   ),
//             ),
//             Radio<forGender>(
//                 value: forGender.other,
//                 groupValue: profileController.enumforGender.value,
//                 onChanged: (val) {
//                   profileController.enumforGender.value = val!;
//                 }),
//             Text(
//               "Other",
//               style: const TextStyle().normal16.textColor(
//                     (profileController.enumforGender.value == forGender.other)
//                         ? ColorSchema.blackColor
//                         : ColorSchema.black54Color,
//                   ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Column ageWidget() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(
//             top: 12,
//           ),
//           child: Text(
//             "Age",
//             style: const TextStyle().errorText12.textColor(
//                   ColorSchema.black54Color,
//                 ),
//           ),
//         ),
//         SizedBox(
//           height: 35,
//           child: CommonTextfield(
//             contentPadding: const EdgeInsets.only(bottom: 15),
//             textOption: TextFieldOption(
//                 inputController: profileController.ageTextEditingController),
//             focusNode: profileController.ageFocusNode,
//             ontap: () {},
//             textCallback: (val) {},
//           ),
//         ),
//       ],
//     );
//   }

//   birthDateWidget() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Birth Date",
//           style: const TextStyle().errorText12.textColor(
//                 ColorSchema.black54Color,
//               ),
//         ),
//         GestureDetector(
//           onTap: () async {
//             final DateTime? pickedDate = await showDatePicker(
//                 context: Get.context!,
//                 initialDate: profileController.birthDate.value,
//                 firstDate: DateTime(1922),
//                 lastDate: DateTime.now());
//             if (pickedDate != null) {
//               profileController.birthDate.value = pickedDate;
//             }
//           },
//           child: Container(
//             height: 35,
//             decoration: const BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(
//                   color: ColorSchema.chatBackGround,
//                 ),
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   profileController.birthDate.value.day
//                           .toString()
//                           .padLeft(2, "0") +
//                       "-" +
//                       profileController.birthDate.value.month
//                           .toString()
//                           .padLeft(2, "0") +
//                       "-" +
//                       profileController.birthDate.value.year.toString(),
//                   style: const TextStyle().normal16.textColor(
//                         ColorSchema.blackColor,
//                       ),
//                 ),
//                 SvgPicture.asset(
//                   ImageConstants.birthDate,
//                   height: 18,
//                   width: 18,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   contactInfoWidget() {
//     return AnimatedCrossFade(
//       firstChild: InkWell(
//         borderRadius: const BorderRadius.all(
//           Radius.circular(8),
//         ),
//         splashColor: Colors.transparent,
//         highlightColor: ColorSchema.greyColor,
//         onTap: () {
//           profileController.experience.value = false;
//           profileController.profileInfo.value = false;
//           profileController.contactInfo.value = true;
//         },
//         child: Padding(
//           padding:
//               const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SvgPicture.asset(
//                 ImageConstants.contactInfo,
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 "Contact Info",
//                 style: const TextStyle()
//                     .normal16
//                     .textColor(ColorSchema.blackColor),
//               ),
//               const Spacer(),
//               SvgPicture.asset(
//                 ImageConstants.arrowDown,
//               ),
//             ],
//           ),
//         ),
//       ),
//       secondChild: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           InkWell(
//             borderRadius: const BorderRadius.all(
//               Radius.circular(8),
//             ),
//             splashColor: Colors.transparent,
//             highlightColor: ColorSchema.greyColor,
//             onTap: () {
//               profileController.experience.value = false;
//               profileController.profileInfo.value = false;
//               profileController.contactInfo.value = false;
//             },
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 left: 10,
//                 right: 10,
//                 bottom: 15,
//                 top: 15,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SvgPicture.asset(
//                     ImageConstants.contactInfo,
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     "Contact Info",
//                     style: const TextStyle()
//                         .normal16
//                         .textColor(ColorSchema.blackColor),
//                   ),
//                   const Spacer(),
//                   SvgPicture.asset(
//                     ImageConstants.arrowUp,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(left: 10, right: 10, bottom: 16),
//             padding:
//                 const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
//             decoration: BoxDecoration(
//                 color: ColorSchema.profileCardBackGround,
//                 borderRadius: BorderRadius.circular(6),
//                 border: Border.all(
//                   color: ColorSchema.chatBackGround,
//                 )),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 emailWidget(),
//                 contactWidget(),
//                 addressWidget(),
//               ],
//             ),
//           ),
//         ],
//       ),
//       crossFadeState: profileController.contactInfo.value
//           ? CrossFadeState.showSecond
//           : CrossFadeState.showFirst,
//       duration: const Duration(
//         milliseconds: 200,
//       ),
//     );
//   }

//   Column addressWidget() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Address:",
//           style: const TextStyle().normal14.textColor(ColorSchema.blackColor),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(
//             top: 12,
//           ),
//           child: Text(
//             "Street 1",
//             style: const TextStyle().errorText12.textColor(
//                   ColorSchema.black54Color,
//                 ),
//           ),
//         ),
//         SizedBox(
//           height: 35,
//           child: CommonTextfield(
//             contentPadding: const EdgeInsets.only(bottom: 15),
//             textOption: TextFieldOption(
//                 inputController:
//                     profileController.address1TextEditingController),
//             focusNode: profileController.address1FocusNode,
//             ontap: () {},
//             textCallback: (val) {},
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(
//             top: 12,
//           ),
//           child: Text(
//             "Street 2",
//             style: const TextStyle().errorText12.textColor(
//                   ColorSchema.black54Color,
//                 ),
//           ),
//         ),
//         SizedBox(
//           height: 35,
//           child: CommonTextfield(
//             contentPadding: const EdgeInsets.only(bottom: 15),
//             textOption: TextFieldOption(
//                 inputController:
//                     profileController.address2TextEditingController),
//             focusNode: profileController.address2FocusNode,
//             ontap: () {},
//             textCallback: (val) {},
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       top: 12,
//                     ),
//                     child: Text(
//                       "Country",
//                       style: const TextStyle().errorText12.textColor(
//                             ColorSchema.black54Color,
//                           ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 35,
//                     child: CommonTextfield(
//                       contentPadding: const EdgeInsets.only(bottom: 15),
//                       textOption: TextFieldOption(
//                           inputController:
//                               profileController.countryTextEditingController),
//                       focusNode: profileController.countryFocusNode,
//                       ontap: () {},
//                       textCallback: (val) {},
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               width: 20,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       top: 12,
//                     ),
//                     child: Text(
//                       "State",
//                       style: const TextStyle().errorText12.textColor(
//                             ColorSchema.black54Color,
//                           ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 35,
//                     child: CommonTextfield(
//                       contentPadding: const EdgeInsets.only(bottom: 15),
//                       textOption: TextFieldOption(
//                           inputController:
//                               profileController.stateTextEditingController),
//                       focusNode: profileController.stateFocusNode,
//                       ontap: () {},
//                       textCallback: (val) {},
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       top: 12,
//                     ),
//                     child: Text(
//                       "City",
//                       style: const TextStyle().errorText12.textColor(
//                             ColorSchema.black54Color,
//                           ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 35,
//                     child: CommonTextfield(
//                       contentPadding: const EdgeInsets.only(bottom: 15),
//                       textOption: TextFieldOption(
//                           inputController:
//                               profileController.cityTextEditingController),
//                       focusNode: profileController.cityFocusNode,
//                       ontap: () {},
//                       textCallback: (val) {},
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               width: 20,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       top: 12,
//                     ),
//                     child: Text(
//                       "Pin Code",
//                       style: const TextStyle().errorText12.textColor(
//                             ColorSchema.black54Color,
//                           ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 35,
//                     child: CommonTextfield(
//                       contentPadding: const EdgeInsets.only(bottom: 15),
//                       textOption: TextFieldOption(
//                           inputController:
//                               profileController.pinCodeTextEditingController),
//                       focusNode: profileController.pinCodeFocusNode,
//                       ontap: () {},
//                       textCallback: (val) {},
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Column contactWidget() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(
//             top: 12,
//           ),
//           child: Text(
//             "Contact",
//             style: const TextStyle().errorText12.textColor(
//                   ColorSchema.black54Color,
//                 ),
//           ),
//         ),
//         SizedBox(
//           height: 35,
//           child: CommonTextfield(
//             contentPadding: const EdgeInsets.only(bottom: 15),
//             textOption: TextFieldOption(
//                 prefixWid: Text(
//                   "+91",
//                   style: const TextStyle().normal16.textColor(
//                         ColorSchema.black54Color,
//                       ),
//                 ),
//                 inputController: profileController.numberTextEditingController),
//             focusNode: profileController.numberFocusNode,
//             ontap: () {},
//             textCallback: (val) {},
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         )
//       ],
//     );
//   }

//   Column emailWidget() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Email",
//           style: const TextStyle().errorText12.textColor(
//                 ColorSchema.black54Color,
//               ),
//         ),
//         SizedBox(
//           height: 35,
//           child: CommonTextfield(
//             contentPadding: const EdgeInsets.only(bottom: 15),
//             textOption: TextFieldOption(
//                 inputController: profileController.emailTextEditingController),
//             focusNode: profileController.emailFocusNode,
//             ontap: () {},
//             textCallback: (val) {},
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         )
//       ],
//     );
//   }

//   experienceWidget() {
//     return AnimatedCrossFade(
//       firstChild: InkWell(
//         borderRadius: const BorderRadius.all(
//           Radius.circular(8),
//         ),
//         splashColor: Colors.transparent,
//         highlightColor: ColorSchema.greyColor,
//         onTap: () {
//           profileController.contactInfo.value = false;
//           profileController.profileInfo.value = false;
//           profileController.experience.value = true;
//         },
//         child: Padding(
//           padding:
//               const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SvgPicture.asset(
//                 ImageConstants.experience,
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 "Experience",
//                 style: const TextStyle()
//                     .normal16
//                     .textColor(ColorSchema.blackColor),
//               ),
//               const Spacer(),
//               SvgPicture.asset(
//                 ImageConstants.arrowDown,
//               ),
//             ],
//           ),
//         ),
//       ),
//       secondChild: Column(
//         children: [
//           InkWell(
//             borderRadius: const BorderRadius.all(
//               Radius.circular(8),
//             ),
//             splashColor: Colors.transparent,
//             highlightColor: ColorSchema.greyColor,
//             onTap: () {
//               profileController.contactInfo.value = false;
//               profileController.profileInfo.value = false;
//               profileController.experience.value = false;
//             },
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 left: 10,
//                 right: 10,
//                 bottom: 15,
//                 top: 15,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SvgPicture.asset(
//                     ImageConstants.experience,
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     "Experience",
//                     style: const TextStyle()
//                         .normal16
//                         .textColor(ColorSchema.blackColor),
//                   ),
//                   const Spacer(),
//                   SvgPicture.asset(
//                     ImageConstants.arrowUp,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(left: 10, right: 10, bottom: 16),
//             padding:
//                 const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
//             decoration: BoxDecoration(
//                 color: ColorSchema.profileCardBackGround,
//                 borderRadius: BorderRadius.circular(6),
//                 border: Border.all(
//                   color: ColorSchema.chatBackGround,
//                 )),
//             child: ListView.separated(
//               padding: const EdgeInsets.all(0),
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: profileController.profileModel.value.profile
//                       ?.professionalInfo?.experience?.length ??
//                   0,
//               separatorBuilder: (context, index) => const SizedBox(
//                 height: 30,
//               ),
//               itemBuilder: (context, index) => Column(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           top: 12,
//                         ),
//                         child: Text(
//                           "Position",
//                           style: const TextStyle().errorText12.textColor(
//                                 ColorSchema.black54Color,
//                               ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 35,
//                         child: CommonTextfield(
//                           contentPadding: const EdgeInsets.only(bottom: 15),
//                           textOption: TextFieldOption(
//                               inputController: profileController
//                                   .profileModel
//                                   .value
//                                   .profile
//                                   ?.professionalInfo
//                                   ?.experience?[index]
//                                   .positionTextEditingController),
//                           focusNode: profileController
//                               .profileModel
//                               .value
//                               .profile
//                               ?.professionalInfo
//                               ?.experience?[index]
//                               .positionFocusNode,
//                           ontap: () {},
//                           textCallback: (val) {},
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       )
//                     ],
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           top: 12,
//                         ),
//                         child: Text(
//                           "Corporation Name",
//                           style: const TextStyle().errorText12.textColor(
//                                 ColorSchema.black54Color,
//                               ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 35,
//                         child: CommonTextfield(
//                           contentPadding: const EdgeInsets.only(bottom: 15),
//                           textOption: TextFieldOption(
//                               inputController: profileController
//                                   .profileModel
//                                   .value
//                                   .profile
//                                   ?.professionalInfo
//                                   ?.experience?[index]
//                                   .corporationTextEditingController),
//                           focusNode: profileController
//                               .profileModel
//                               .value
//                               .profile
//                               ?.professionalInfo
//                               ?.experience?[index]
//                               .corporationFocusNode,
//                           ontap: () {},
//                           textCallback: (val) {},
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       )
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 top: 12,
//                               ),
//                               child: Text(
//                                 "Joining Date",
//                                 style: const TextStyle().errorText12.textColor(
//                                       ColorSchema.black54Color,
//                                     ),
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () async {
//                                 final DateTime? pickedDate =
//                                     await showDatePicker(
//                                         context: Get.context!,
//                                         initialDate: DateTime.now(),
//                                         firstDate: DateTime(2015),
//                                         lastDate: DateTime.now());
//                                 if (pickedDate != null) {
//                                   profileController
//                                       .profileModel
//                                       .value
//                                       .profile
//                                       ?.professionalInfo
//                                       ?.experience![index]
//                                       .joinDate = pickedDate;
//                                 }
//                               },
//                               child: Container(
//                                 height: 35,
//                                 decoration: const BoxDecoration(
//                                   border: Border(
//                                     bottom: BorderSide(
//                                       color: ColorSchema.chatBackGround,
//                                     ),
//                                   ),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       profileController
//                                               .profileModel
//                                               .value
//                                               .profile!
//                                               .professionalInfo!
//                                               .experience![index]
//                                               .joinDate!
//                                               .day
//                                               .toString()
//                                               .padLeft(2, "0") +
//                                           "-" +
//                                           profileController
//                                               .profileModel
//                                               .value
//                                               .profile!
//                                               .professionalInfo!
//                                               .experience![index]
//                                               .joinDate!
//                                               .month
//                                               .toString()
//                                               .padLeft(2, "0") +
//                                           "-" +
//                                           profileController
//                                               .profileModel
//                                               .value
//                                               .profile!
//                                               .professionalInfo!
//                                               .experience![index]
//                                               .joinDate!
//                                               .year
//                                               .toString(),
//                                       style:
//                                           const TextStyle().normal16.textColor(
//                                                 ColorSchema.blackColor,
//                                               ),
//                                     ),
//                                     SvgPicture.asset(
//                                       ImageConstants.birthDate,
//                                       height: 18,
//                                       width: 18,
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 top: 12,
//                               ),
//                               child: Text(
//                                 "Release Date",
//                                 style: const TextStyle().errorText12.textColor(
//                                       ColorSchema.black54Color,
//                                     ),
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () async {
//                                 final DateTime? pickedDate =
//                                     await showDatePicker(
//                                         context: Get.context!,
//                                         initialDate: DateTime.now(),
//                                         firstDate: DateTime(2015),
//                                         lastDate: DateTime.now());
//                                 if (pickedDate != null) {
//                                   profileController
//                                       .profileModel
//                                       .value
//                                       .profile!
//                                       .professionalInfo!
//                                       .experience![index]
//                                       .releaseDate = pickedDate;
//                                 }
//                               },
//                               child: Container(
//                                 height: 35,
//                                 decoration: const BoxDecoration(
//                                   border: Border(
//                                     bottom: BorderSide(
//                                       color: ColorSchema.chatBackGround,
//                                     ),
//                                   ),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       profileController
//                                               .profileModel
//                                               .value
//                                               .profile!
//                                               .professionalInfo!
//                                               .experience![index]
//                                               .releaseDate!
//                                               .day
//                                               .toString()
//                                               .padLeft(2, "0") +
//                                           "-" +
//                                           profileController
//                                               .profileModel
//                                               .value
//                                               .profile!
//                                               .professionalInfo!
//                                               .experience![index]
//                                               .releaseDate!
//                                               .month
//                                               .toString()
//                                               .padLeft(2, "0") +
//                                           "-" +
//                                           profileController
//                                               .profileModel
//                                               .value
//                                               .profile!
//                                               .professionalInfo!
//                                               .experience![index]
//                                               .releaseDate!
//                                               .year
//                                               .toString(),
//                                       style:
//                                           const TextStyle().normal16.textColor(
//                                                 ColorSchema.blackColor,
//                                               ),
//                                     ),
//                                     SvgPicture.asset(
//                                       ImageConstants.birthDate,
//                                       height: 18,
//                                       width: 18,
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       crossFadeState: profileController.experience.value
//           ? CrossFadeState.showSecond
//           : CrossFadeState.showFirst,
//       duration: const Duration(
//         milliseconds: 200,
//       ),
//     );
//   }
// }
