// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:jhclinicapp/helper/utils/common_functions.dart';
// import 'package:jhclinicapp/helper/utils/images.dart';
// import 'package:jhclinicapp/schemata/color_schema.dart';
// import 'package:jhclinicapp/schemata/text_style.dart';
// import 'package:stream_chat_flutter/stream_chat_flutter.dart';

// class ChatProfileScreen extends StatelessWidget {
//   ChatProfileScreen({Key? key}) : super(key: key);
//   Channel? channel;
//   @override
//   Widget build(BuildContext context) {
//     channel = Get.arguments;
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             margin:
//                 const EdgeInsets.only(top: 45, right: 20, left: 20, bottom: 15),
//             child: Row(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: SvgPicture.asset(
//                     ImageConstants.backIcon,
//                     color: ColorSchema.blackColor,
//                   ),
//                 ),
//                 const Spacer(),
//                 Text(
//                   "Contact Info",
//                   style: const TextStyle()
//                       .medium20
//                       .textColor(ColorSchema.blackColor),
//                 ),
//                 const Spacer(),
//               ],
//             ),
//           ),
//           Expanded(
//             child: StreamChannel(
//               channel: channel!,
//               child: CustomScrollView(
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
//                     expandedHeight: 300,
//                     flexibleSpace: FlexibleSpaceBar(
//                       stretchModes: const [StretchMode.zoomBackground],
//                       background: SizedBox(
//                         width: double.infinity,
//                         child: ChannelAvatar(
//                           borderRadius: BorderRadius.circular(0),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SliverToBoxAdapter(
//                     child: Padding(
//                       padding:
//                           const EdgeInsets.only(left: 20, right: 20, top: 20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     ChannelName(
//                                       textStyle:
//                                           const TextStyle().medium20.textColor(
//                                                 ColorSchema.blackColor,
//                                               ),
//                                     ),
//                                     // Text(
//                                     //   member?.user?.name ?? "",
//                                     //   style: const TextStyle().medium20.textColor(
//                                     //         ColorSchema.blackColor,
//                                     //       ),
//                                     // ),
//                                     Text(
//                                       "+1 202 555 0181",
//                                       style: const TextStyle(height: 1.3)
//                                           .medium14
//                                           .textColor(
//                                             ColorSchema.black54Color,
//                                           ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 height: 40,
//                                 width: 40,
//                                 decoration: const BoxDecoration(
//                                     color: ColorSchema.lightPrimaryColor,
//                                     shape: BoxShape.circle),
//                                 child: Center(
//                                   child: SvgPicture.asset(
//                                     ImageConstants.chatIcon,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 height: 40,
//                                 width: 40,
//                                 margin:
//                                     const EdgeInsets.only(left: 15, right: 15),
//                                 decoration: const BoxDecoration(
//                                     color: ColorSchema.lightPrimaryColor,
//                                     shape: BoxShape.circle),
//                                 child: Center(
//                                   child: SvgPicture.asset(
//                                     ImageConstants.videoCallIcon,
//                                     color: ColorSchema.primaryColor,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 height: 40,
//                                 width: 40,
//                                 decoration: const BoxDecoration(
//                                     color: ColorSchema.lightPrimaryColor,
//                                     shape: BoxShape.circle),
//                                 child: Center(
//                                   child: SvgPicture.asset(
//                                     ImageConstants.audioCallIcon,
//                                     color: ColorSchema.primaryColor,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 16,
//                           ),
//                           commonDivider(),
//                           const SizedBox(
//                             height: 16,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 10, right: 10),
//                             child: Column(
//                               children: [
//                                 commonBottomWidget(
//                                     icon: ImageConstants.chatGalleryIcon,
//                                     name: "Media, Links, and Docs",
//                                     subName: "12"),
//                                 commonDivider(),
//                                 commonBottomWidget(
//                                     icon: ImageConstants.searchIcon,
//                                     name: "Chat Search",
//                                     subName: ""),
//                                 commonDivider(),
//                                 commonBottomWidget(
//                                     icon: ImageConstants.soundIcon,
//                                     name: "Mute",
//                                     subName: "No"),
//                                 commonDivider(),
//                                 commonBottomWidget(
//                                     icon: ImageConstants.saveToCameraIcon,
//                                     name: "Save to Camera Roll",
//                                     subName: "Default"),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Row commonBottomWidget({
//     String? icon,
//     String? name,
//     String? subName,
//   }) {
//     return Row(
//       children: [
//         Container(
//           height: 30,
//           width: 30,
//           margin: const EdgeInsets.only(
//             top: 10,
//             bottom: 10,
//           ),
//           decoration: BoxDecoration(
//             color: ColorSchema.black10Color,
//             borderRadius: BorderRadius.circular(
//               6,
//             ),
//           ),
//           child: Center(
//               child: SvgPicture.asset(
//             icon!,
//             color: ColorSchema.blackColor,
//           )),
//         ),
//         const SizedBox(
//           width: 15,
//         ),
//         Text(
//           name!,
//           style: const TextStyle().normal16.textColor(ColorSchema.blackColor),
//         ),
//         const Spacer(),
//         Text(
//           subName!,
//           style: const TextStyle().normal16.textColor(ColorSchema.black38Color),
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         const Icon(
//           Icons.arrow_forward_ios,
//           color: ColorSchema.black38Color,
//           size: 12,
//         )
//       ],
//     );
//   }
// }
