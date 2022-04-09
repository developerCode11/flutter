// // ignore_for_file: empty_catches

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:jhclinicapp/app/modules/profile/profile_controller.dart';
// import 'package:jhclinicapp/app/routes/app_pages.dart';
// import 'package:jhclinicapp/helper/utils/common_functions.dart';
// import 'package:jhclinicapp/helper/utils/date_utils.dart';
// import 'package:jhclinicapp/helper/utils/images.dart';
// import 'package:jhclinicapp/schemata/color_schema.dart';
// import 'package:jhclinicapp/schemata/text_style.dart';
// import '../chat/chat_user_list.dart';

// class ProfileScreen extends StatelessWidget {
//   ProfileScreen({Key? key}) : super(key: key);

//   final profileController = Get.find<ProfileController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Obx(
//         () => (profileController.profileModel.value.profile == null)
//             ? const Center(
//                 child: CupertinoActivityIndicator(radius: 15),
//               )
//             : CustomScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 slivers: [
//                   SliverAppBar(
//                     leading: Container(),
//                     systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
//                         // statusBarColor: Colors.white, // this one for android
//                         statusBarBrightness:
//                             Brightness.light, // this one for iOS
//                         statusBarColor: Colors.transparent),
//                     shadowColor: Colors.transparent,
//                     backgroundColor: Colors.transparent,
//                     stretch: true,
//                     pinned: false,
//                     snap: false,
//                     floating: false,
//                     expandedHeight:
//                         (MediaQuery.of(context).size.height * 0.35) + 50,
//                     flexibleSpace: FlexibleSpaceBar(
//                       stretchModes: const [StretchMode.zoomBackground],
//                       background: Container(
//                         padding:
//                             const EdgeInsets.only(top: 40, left: 20, right: 20),
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: NetworkImage(
//                               profileController
//                                       .profileModel.value.profile?.imageUrl ??
//                                   "",
//                             ),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 Get.back();
//                               },
//                               child: Container(
//                                 height: 40,
//                                 width: 40,
//                                 padding: const EdgeInsets.all(12),
//                                 decoration: BoxDecoration(
//                                   color:
//                                       ColorSchema.black10Color.withOpacity(0.5),
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: SvgPicture.asset(
//                                   ImageConstants.backIcon,
//                                   color: ColorSchema.blackColor,
//                                 ),
//                               ),
//                             ),
//                             Column(
//                               children: [
//                                 GestureDetector(
//                                   onTap: () {
//                                     profileController.contactInfo.value = false;
//                                     profileController.profileInfo.value = false;
//                                     profileController.experience.value = false;
//                                     Get.toNamed(Routes.editProfile);
//                                   },
//                                   child: Container(
//                                     height: 40,
//                                     width: 40,
//                                     padding: const EdgeInsets.all(12),
//                                     decoration: BoxDecoration(
//                                       color: ColorSchema.black10Color
//                                           .withOpacity(0.5),
//                                       shape: BoxShape.circle,
//                                     ),
//                                     child: SvgPicture.asset(
//                                       ImageConstants.editIcon,
//                                       color: ColorSchema.blackColor,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 GestureDetector(
//                                   onTap: () async {
//                                     await GetStorage().erase();
//                                     try {
//                                       String? token = await FirebaseMessaging
//                                           .instance
//                                           .getToken();
//                                       await client.removeDevice(token!);
//                                       await client.disconnectUser();
//                                     } catch (e) {}
//                                     Get.toNamed(Routes.signIn);
//                                   },
//                                   child: Container(
//                                       height: 40,
//                                       width: 40,
//                                       padding: const EdgeInsets.all(12),
//                                       decoration: BoxDecoration(
//                                         color: ColorSchema.black10Color
//                                             .withOpacity(0.5),
//                                         shape: BoxShape.circle,
//                                       ),
//                                       child: const Icon(
//                                         Icons.logout_rounded,
//                                         color: ColorSchema.blackColor,
//                                         size: 20,
//                                       )),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SliverToBoxAdapter(
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                         top: 15,
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           nameAndAboutMeWidget(),
//                           Padding(
//                             padding: const EdgeInsets.only(
//                               left: 10,
//                               right: 10,
//                             ),
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                     left: 10,
//                                     right: 10,
//                                   ),
//                                   child: commonDivider(),
//                                 ),
//                                 generalInfoWidget(),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                     left: 10,
//                                     right: 10,
//                                   ),
//                                   child: commonDivider(),
//                                 ),
//                                 contactInfoWidget(),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                     left: 10,
//                                     right: 10,
//                                   ),
//                                   child: commonDivider(),
//                                 ),
//                                 experienceWidget(),
//                                 const SizedBox(
//                                   height: 30,
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//       ),
//     );
//   }

//   nameAndAboutMeWidget() {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 20,
//         right: 20,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             '${profileController.profileModel.value.profile?.basicInfo?.firstName ?? ""} ${profileController.profileModel.value.profile?.basicInfo?.lastName ?? ""}',
//             style: const TextStyle().medium20.textColor(
//                   ColorSchema.blackColor,
//                 ),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           SizedBox(
//             height: 20,
//             child: ListView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 padding: const EdgeInsets.all(0),
//                 scrollDirection: Axis.horizontal,
//                 shrinkWrap: true,
//                 itemCount: profileController.profileModel.value.profile
//                         ?.professionalInfo?.specialization?.length ??
//                     0,
//                 itemBuilder: (contexti, i) {
//                   return Text(
//                     (profileController.profileModel.value.profile
//                                 ?.professionalInfo?.specialization?[i]
//                                 .toString() ??
//                             "") +
//                         ",",
//                     style: const TextStyle().normal16.textColor(
//                           ColorSchema.black54Color,
//                         ),
//                   );
//                 }),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               top: 15,
//               bottom: 15,
//             ),
//             child: commonDivider(),
//           ),
//           Row(
//             children: [
//               SvgPicture.asset(
//                 ImageConstants.aboutInfo,
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 "About me",
//                 style: const TextStyle()
//                     .normal16
//                     .textColor(ColorSchema.blackColor),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Row(
//             children: [
//               const SizedBox(
//                 width: 25,
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       profileController
//                               .profileModel.value.profile?.basicInfo?.about ??
//                           "",
//                       style: const TextStyle().normal14.textColor(
//                             ColorSchema.black54Color,
//                           ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//         ],
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
//           // profileController.contactInfo.value = false;
//           // profileController.experience.value = false;
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
//               // profileController.contactInfo.value = false;
//               // profileController.experience.value = false;
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
//             padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
//             decoration: BoxDecoration(
//                 color: ColorSchema.profileCardBackGround,
//                 borderRadius: BorderRadius.circular(6),
//                 border: Border.all(
//                   color: ColorSchema.chatBackGround,
//                 )),
//             child: Column(
//               children: [
//                 commonTitleSubTitleWidget(
//                     icon: ImageConstants.birthDate,
//                     title: "Birth Date",
//                     subtitle: DateUtilities()
//                         .convertServerDateToFormatterString(
//                             profileController.profileModel.value.profile!
//                                 .basicInfo!.dateOfBirth
//                                 .toString(),
//                             formatter: DateUtilities.dd_mm_yyyy)),
//                 commonTitleSubTitleWidget(
//                     icon: ImageConstants.age, title: "Age", subtitle: "36"),
//                 commonTitleSubTitleWidget(
//                     icon: ImageConstants.gender,
//                     title: "Gender",
//                     subtitle: profileController
//                             .profileModel.value.profile?.basicInfo?.gender ??
//                         ""),
//                 commonTitleSubTitleWidget(
//                     icon: ImageConstants.language,
//                     title: "Referred Language",
//                     subtitle: "Russian, English, German"),
//               ],
//             ),
//           )
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

//   contactInfoWidget() {
//     return AnimatedCrossFade(
//       firstChild: InkWell(
//         borderRadius: const BorderRadius.all(
//           Radius.circular(8),
//         ),
//         splashColor: Colors.transparent,
//         highlightColor: ColorSchema.greyColor,
//         onTap: () {
//           // profileController.experience.value = false;
//           // profileController.profileInfo.value = false;
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
//         children: [
//           InkWell(
//             borderRadius: const BorderRadius.all(
//               Radius.circular(8),
//             ),
//             splashColor: Colors.transparent,
//             highlightColor: ColorSchema.greyColor,
//             onTap: () {
//               // profileController.experience.value = false;
//               // profileController.profileInfo.value = false;
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
//             padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
//             decoration: BoxDecoration(
//                 color: ColorSchema.profileCardBackGround,
//                 borderRadius: BorderRadius.circular(6),
//                 border: Border.all(
//                   color: ColorSchema.chatBackGround,
//                 )),
//             child: Column(
//               children: [
//                 commonTitleSubTitleWidget(
//                     icon: ImageConstants.email,
//                     title: "Email",
//                     subtitle: profileController
//                             .profileModel.value.profile?.user?.email ??
//                         ""),
//                 commonTitleSubTitleWidget(
//                     icon: ImageConstants.phone,
//                     title: "Phone number",
//                     subtitle: profileController
//                             .profileModel.value.profile?.phoneNumber ??
//                         ""),
//                 commonTitleSubTitleWidget(
//                   icon: ImageConstants.address,
//                   title: "Address",
//                   subtitle:
//                       "1473 Melrose Street, Spokane Valley, Washington, 99206sasas",
//                 ),
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

//   experienceWidget() {
//     return AnimatedCrossFade(
//       firstChild: InkWell(
//         borderRadius: const BorderRadius.all(
//           Radius.circular(8),
//         ),
//         splashColor: Colors.transparent,
//         highlightColor: ColorSchema.greyColor,
//         onTap: () {
//           // profileController.contactInfo.value = false;
//           // profileController.profileInfo.value = false;
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
//               // profileController.contactInfo.value = false;
//               profileController.experience.value = false;
//               // profileController.profileInfo.value = false;
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
//               margin: const EdgeInsets.only(left: 10, right: 10, bottom: 16),
//               padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
//               decoration: BoxDecoration(
//                   color: ColorSchema.profileCardBackGround,
//                   borderRadius: BorderRadius.circular(6),
//                   border: Border.all(
//                     color: ColorSchema.chatBackGround,
//                   )),
//               child: ListView.separated(
//                   padding: const EdgeInsets.all(0),
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) => commonTitleSubTitleWidget(
//                         icon: ImageConstants.health,
//                         title: profileController
//                                 .profileModel
//                                 .value
//                                 .profile
//                                 ?.professionalInfo
//                                 ?.experience?[index]
//                                 .positionTextEditingController
//                                 .text ??
//                             "",
//                         subtitle: (profileController
//                                     .profileModel
//                                     .value
//                                     .profile
//                                     ?.professionalInfo
//                                     ?.experience?[index]
//                                     .corporationTextEditingController
//                                     .text ??
//                                 "") +
//                             ": " +
//                             DateUtilities().convertServerDateToFormatterString(
//                                 profileController
//                                         .profileModel
//                                         .value
//                                         .profile
//                                         ?.professionalInfo
//                                         ?.experience?[index]
//                                         .joinDate
//                                         .toString() ??
//                                     "",
//                                 formatter: DateUtilities.mmm_yyyy) +
//                             " - " +
//                             DateUtilities().convertServerDateToFormatterString(
//                                 profileController
//                                         .profileModel
//                                         .value
//                                         .profile
//                                         ?.professionalInfo
//                                         ?.experience?[index]
//                                         .releaseDate
//                                         .toString() ??
//                                     "",
//                                 formatter: DateUtilities.mmm_yyyy),
//                       ),
//                   separatorBuilder: (context, index) => const SizedBox(
//                         height: 10,
//                       ),
//                   itemCount: profileController.profileModel.value.profile
//                           ?.professionalInfo?.experience?.length ??
//                       0))
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

//   commonTitleSubTitleWidget({String? title, String? icon, String? subtitle}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             SvgPicture.asset(icon!),
//             const SizedBox(
//               width: 10,
//             ),
//             Text(
//               title!,
//               style: const TextStyle()
//                   .errorText12
//                   .textColor(ColorSchema.blackColor),
//             )
//           ],
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         Row(
//           children: [
//             const SizedBox(
//               width: 25,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     subtitle!,
//                     style: const TextStyle().normal14.textColor(
//                           ColorSchema.black54Color,
//                         ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 16,
//         ),
//       ],
//     );
//   }
// }
