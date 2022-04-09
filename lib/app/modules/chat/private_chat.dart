// // ignore_for_file: must_be_immutable

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:jhclinicapp/app/modules/bottomBar/bottombar_controller.dart';
// import 'package:jhclinicapp/app/modules/chat/chat_user_list.dart';
// import 'package:jhclinicapp/app/modules/chat/thred_page.dart';
// import 'package:jhclinicapp/helper/utils/common_functions.dart';
// import 'package:jhclinicapp/helper/utils/images.dart';
// import 'package:jhclinicapp/schemata/color_schema.dart';
// import 'package:jhclinicapp/schemata/text_style.dart';
// import 'package:stream_chat_flutter/stream_chat_flutter.dart';
// import '../../routes/app_pages.dart';

// class PrivateChatScreen extends StatelessWidget {
//   Channel? channel;
//   String allUserName = "";
//   PrivateChatScreen({Key? key}) : super(key: key);

//   final bottombarController = Get.find<BottomBarController>();
//   @override
//   Widget build(BuildContext context) {
//     RxBool selected = false.obs;
//     channel = Get.arguments;
//     return GetBuilder<BottomBarController>(
//       init: BottomBarController(),
//       initState: (state) {},
//       builder: (controller) {
//         // ignore: deprecated_member_use
//         return ((client.state.user?.id ?? "").isNotEmpty &&
//                 controller.channels.isNotEmpty)
//             ? StreamChannel(
//                 channel: channel!,
//                 child: Builder(
//                   builder: (context) {
//                     final userId = StreamChat.of(context).currentUser?.id;

//                     final otherMember =
//                         channel!.state!.members.firstWhereOrNull(
//                       (element) => element.userId != userId,
//                     );
//                     allUserName = "";
//                     for (int i = 0; i < channel!.state!.members.length; i++) {
//                       if (userId != channel!.state!.members[i].user!.id) {
//                         allUserName +=
//                             (channel!.state!.members[i].user!.name.trimRight() +
//                                 ", ");
//                       }
//                     }
//                     allUserName = allUserName.replaceFirst(
//                         ", ", "", allUserName.length - 2);
//                     return Scaffold(
//                       backgroundColor: ColorSchema.whiteColor,
//                       resizeToAvoidBottomInset: true,
//                       // appBar: ChannelHeader(),
//                       body: Padding(
//                         padding: const EdgeInsets.only(top: 30),
//                         child: Column(
//                           children: <Widget>[
//                             headerWidget(otherMember),
//                             messageListWidget(selected),
//                             messageInputWidget(),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               )
//             : const Scaffold(
//                 body: Center(
//                   child: CupertinoActivityIndicator(radius: 15),
//                 ),
//               );
//       },
//     );
//   }

//   Container messageInputWidget() {
//     return Container(
//       alignment: Alignment.topCenter,
//       child: MessageInput(
//         shouldKeepFocusAfterMessage: true,

//         activeSendButton: Container(
//           margin: const EdgeInsets.only(left: 10, right: 25),
//           height: 50,
//           width: 50,
//           decoration: const BoxDecoration(
//             color: ColorSchema.primaryColor,
//             shape: BoxShape.circle,
//           ),
//           child: Center(child: SvgPicture.asset(ImageConstants.sendIcon)),
//         ),

//         idleSendButton: Container(
//           margin: const EdgeInsets.only(left: 10, right: 25),
//           height: 50,
//           width: 50,
//           decoration: const BoxDecoration(
//             color: ColorSchema.black10Color,
//             shape: BoxShape.circle,
//           ),
//           child: Center(
//               child: SvgPicture.asset(
//             ImageConstants.sendIcon,
//             color: ColorSchema.chatBackGround,
//           )),
//         ),
//         quotedMessage: bottombarController.quotedMessage,
//         onQuotedMessageCleared: () {
//           bottombarController.quotedMessage = null;
//           bottombarController.update();
//         },
//         // ignore: deprecated_member_use
//         mentionsTileBuilder: (_, member) =>
//             // ignore: deprecated_member_use
//             member.user!.id != client.state.user!.id
//                 // ignore: deprecated_member_use
//                 ? MentionTile(
//                     member,
//                     subtitle: Container(),
//                   )
//                 : Container(),
//         showCommandsButton: false,
//       ),
//     );
//   }

//   Expanded messageListWidget(RxBool selected) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10),
//         child: MessageListView(
//           spacingWidgetBuilder: (context, spacingTypes) {
//             return const Padding(
//               padding: EdgeInsets.only(top: 8, right: 0, left: 0),
//             );
//           },
//           paginationLoadingIndicatorBuilder: (context) {
//             return const CupertinoActivityIndicator(
//               radius: 15,
//               // color: ColorSchema.blackColor,
//             );
//           },
//           loadingBuilder: (context) {
//             return const CupertinoActivityIndicator(
//               radius: 15,
//               // color: ColorSchema.whiteColor,
//             );
//           },
//           messageHighlightColor: ColorSchema.redColor,
//           initialAlignment: 0,
//           messageBuilder:
//               (context, details, messageList, defaultMessageWidget) {
//             return defaultMessageWidget.copyWith(
//               attachmentBorderSide: BorderSide.none,
//               attachmentBorderRadiusGeometry: BorderRadius.circular(5),
//               attachmentShape: OutlineInputBorder(
//                   borderSide: BorderSide.none,
//                   borderRadius: BorderRadius.circular(5)),
//               attachmentPadding: const EdgeInsets.all(0),
//               borderSide: BorderSide.none,
//               borderRadiusGeometry: BorderRadius.circular(12),
//               padding: const EdgeInsets.all(0),
//               showUserAvatar: DisplayWidget.gone,
//               showReplyMessage: true,
//               showCopyMessage: true,
//               showEditMessage: details.isMyMessage,
//               showPinButton: true,
//               showFlagButton: true,
//               // showInChannelIndicator: true,
//               showResendMessage: true,
//               showSendingIndicator: true,
//               showPinHighlight: true,
//               showReactions: true,
//               showUsername: true,
//               showDeleteMessage: details.isMyMessage,
//               userAvatarBuilder: (val, user) {
//                 return Container();
//               },
//             );
//           },
//           scrollPhysics: const BouncingScrollPhysics(),
//           highlightInitialMessage: true,
//           onMessageSwiped: (val) {
//             bottombarController.quotedMessage = val;
//             bottombarController.update();
//           },
//           messageFilter: selected.value
//               ? (message) => message.mentionedUsers.any((element) =>
//                   // ignore: deprecated_member_use
//                   element.id ==
//                   // ignore: deprecated_member_use
//                   client.state.user!.id)
//               : null,
//           threadBuilder: (_, parentMessage) => ThreadPage(
//             parent: parentMessage,
//           ),
//         ),
//       ),
//     );
//   }

//   Container headerWidget(Member? otherMember) {
//     Member otherMemberOwner = channel!.state!.members.firstWhere((element) {
//       return element.role == "owner";
//     });
//     return Container(
//       padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
//       decoration: const BoxDecoration(
//           color: Colors.white,
//           border: Border(
//               bottom: BorderSide(color: ColorSchema.black10Color, width: 1))),
//       child: Row(
//         children: [
//           InkWell(
//             onTap: () {
//               Get.back();
//             },
//             child: SvgPicture.asset(
//               ImageConstants.backIcon,
//               color: ColorSchema.blackColor,
//             ),
//           ),
//           Stack(
//             alignment: Alignment.bottomRight,
//             children: [
//               // Padding(
//               //   padding: const EdgeInsets.only(left: 20, right: 15),
//               //   child: StreamChannel(
//               //     channel: channel!,
//               //     child: ChannelAvatar(
//               //       // channel: channelList[index],
//               //       borderRadius: BorderRadius.circular(20),
//               //       constraints: const BoxConstraints(
//               //         maxHeight: 35,
//               //         maxWidth: 35,
//               //         minHeight: 35,
//               //         minWidth: 35,
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               (!isNullEmptyOrFalse(otherMemberOwner.user?.image ?? ""))
//                   ? Container(
//                       height: 35,
//                       width: 35,
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: NetworkImage(
//                               otherMemberOwner.user?.image ?? "",
//                             ),
//                           ),
//                           shape: BoxShape.circle),
//                       margin: const EdgeInsets.only(left: 20, right: 15),
//                     )
//                   : Container(
//                       height: 35,
//                       width: 35,
//                       margin: const EdgeInsets.only(left: 20, right: 15),
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                       ),
//                       child: Center(
//                         child: SvgPicture.asset(
//                           ImageConstants.defaultUserIcon,
//                           height: 35,
//                           width: 35,
//                         ),
//                       ),
//                     ),
//               // Container(
//               //   height: 15,
//               //   width: 15,
//               //   margin: const EdgeInsets.only(
//               //     right: 10,
//               //   ),
//               //   padding: const EdgeInsets.all(3),
//               //   decoration: const BoxDecoration(
//               //       color: ColorSchema.whiteColor, shape: BoxShape.circle),
//               //   child: Container(
//               //     padding: const EdgeInsets.all(2),
//               //     decoration: BoxDecoration(
//               //         color: (DateUtilities().timeAgoSinceDate(
//               //                     otherMember!.user!.lastActive.toString()) ==
//               //                 "Online")
//               //             ? ColorSchema.greenColor
//               //             : ColorSchema.black38Color,
//               //         shape: BoxShape.circle),
//               //   ),
//               // ),
//             ],
//           ),
//           Expanded(
//             child: InkWell(
//               onTap: () {
//                 Get.toNamed(Routes.chatProfileScreen, arguments: channel);
//               },
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     channel?.name ?? "",
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                     style: const TextStyle()
//                         .medium20
//                         .textColor(ColorSchema.blackColor),
//                   ),
//                   StreamBuilder<Map<User, Event>>(
//                       stream: channel!.state!.typingEventsStream,
//                       builder: (context, snapshot) {
//                         if (snapshot.hasData) {
//                           if (snapshot.data!.isNotEmpty) {
//                             return Text("Typing...",
//                                 style: const TextStyle()
//                                     .errorText12
//                                     .textColor(ColorSchema.greenColor));
//                           }
//                         }

//                         return Text(
//                           allUserName,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(height: 1.5)
//                               .errorText12
//                               .textColor(ColorSchema.black54Color),
//                         );
//                         // return Text(
//                         //   DateUtilities().timeAgoSinceDate(
//                         //       otherMember!.user!.lastActive.toString()),
//                         //   style: const TextStyle(height: 1.5)
//                         //       .errorText12
//                         //       .textColor(ColorSchema.black54Color),
//                         // );
//                       })
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               SvgPicture.asset(ImageConstants.videoCallIcon,
//                   color: ColorSchema.black38Color),
//               const SizedBox(
//                 width: 16,
//               ),
//               SvgPicture.asset(ImageConstants.audioCallIcon,
//                   color: ColorSchema.black38Color),
//               const SizedBox(
//                 width: 16,
//               ),
//               SvgPicture.asset(ImageConstants.menuIcon),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
