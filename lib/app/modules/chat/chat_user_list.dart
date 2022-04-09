// // ignore_for_file: deprecated_member_use

// import 'dart:async';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:jhclinicapp/app/routes/app_pages.dart';
// import 'package:jhclinicapp/components/common_textfield.dart';
// import 'package:jhclinicapp/helper/utils/common_functions.dart';
// import 'package:jhclinicapp/helper/utils/constants.dart';
// import 'package:jhclinicapp/helper/utils/date_utils.dart';
// import 'package:jhclinicapp/helper/utils/images.dart';
// import 'package:jhclinicapp/schemata/color_schema.dart';
// import 'package:stream_chat_flutter/stream_chat_flutter.dart';
// import 'package:jhclinicapp/schemata/text_style.dart';
// import '../bottomBar/bottombar_controller.dart';

// var client = StreamChatClient(ApiConstants.streamChatKey);

// class ChatUserListScreen extends StatefulWidget {
//   const ChatUserListScreen({Key? key}) : super(key: key);

//   @override
//   State<ChatUserListScreen> createState() => _ChatUserListScreenState();
// }

// class _ChatUserListScreenState extends State<ChatUserListScreen> {
//   final bottomBarController =
//       Get.put<BottomBarController>(BottomBarController());
//   ScrollController scrollController = ScrollController();
//   ChannelListController channelListController = ChannelListController();
//   Timer? _debounce;
//   String query = "";
//   @override
//   void initState() {
//     super.initState();
//     bottomBarController.searchTextFieldController.addListener(_onSearchChanged);
//   }

//   @override
//   void dispose() {
//     bottomBarController.searchTextFieldController
//         .removeListener(_onSearchChanged);
//     bottomBarController.searchTextFieldController.dispose();
//     super.dispose();
//   }

//   _onSearchChanged() {
//     if (_debounce?.isActive ?? false) _debounce!.cancel();
//     _debounce = Timer(const Duration(milliseconds: 500), () {
//       ///here you perform your search
//       bottomBarController.searchingMember(
//           val: bottomBarController.searchTextFieldController.text);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorSchema.whiteColor,
//       body: SafeArea(
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).requestFocus(FocusNode());
//           },
//           child: ChannelsBloc(
//             child: Column(
//               children: [
//                 GetBuilder<BottomBarController>(
//                   init: BottomBarController(),
//                   builder: (_) {
//                     channelListController.loadData;
//                     List<String> ids = [];
//                     Filter filter;
//                     if ((client.state.user?.id ?? "").isNotEmpty) {
//                       (bottomBarController
//                               .searchTextFieldController.text.isNotEmpty)
//                           ? (!isNullEmptyOrFalse(
//                                   bottomBarController.listForSearching))
//                               ? ids.addAll(bottomBarController.listForSearching)
//                               : ids.add(client.state.user!.id)
//                           : ids.add(client.state.user!.id);
//                     }
//                     filter = Filter.in_("members", ids);

//                     print("Filter=========>  " + filter.toString());
//                     return (client.state.user?.id ?? "").isNotEmpty
//                         ? Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                 top: 0,
//                                 left: 20,
//                                 right: 20,
//                               ),
//                               child: Column(
//                                 children: [
//                                   headerWidget(),
//                                   searchWidget(),
//                                   (bottomBarController.searchTextFieldController
//                                               .text.isNotEmpty &&
//                                           bottomBarController.channels.isEmpty)
//                                       ? const Text("No Result Found")
//                                       : Expanded(
//                                           child: ChannelListView(
//                                             padding: const EdgeInsets.all(0),
//                                             sort: const [
//                                               SortOption('last_message_at')
//                                             ],
//                                             filter: filter,
//                                             channelListController:
//                                                 channelListController,
//                                             loadingBuilder: (val) {
//                                               return const Center(
//                                                 child:
//                                                     CupertinoActivityIndicator(
//                                                         radius: 15),
//                                               );
//                                             },
//                                             listBuilder:
//                                                 (context, channelList) {
//                                               print(
//                                                   "channel list --- ${channelList.length}");
//                                               return ListView.separated(
//                                                   physics:
//                                                       const BouncingScrollPhysics(),
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           top: 20),
//                                                   itemCount: channelList.length,
//                                                   separatorBuilder:
//                                                       (context, index) {
//                                                     return const SizedBox(
//                                                       height: 10,
//                                                     );
//                                                   },
//                                                   itemBuilder:
//                                                       (context, index) {
//                                                     final userId =
//                                                         StreamChat.of(context)
//                                                             .currentUser
//                                                             ?.id;
//                                                     Member? otherMember;

//                                                     otherMember =
//                                                         channelList[index]
//                                                             .state!
//                                                             .members
//                                                             .firstWhereOrNull(
//                                                               (element) =>
//                                                                   element
//                                                                       .userId !=
//                                                                   userId,
//                                                             );

//                                                     return InkWell(
//                                                       onTap: () {
//                                                         Get.toNamed(
//                                                           Routes
//                                                               .privateChatScreen,
//                                                           arguments:
//                                                               channelList[
//                                                                   index],
//                                                         )!
//                                                             .then(
//                                                           (value) {
//                                                             bottomBarController
//                                                                 .update();
//                                                           },
//                                                         );
//                                                         FocusScope.of(context)
//                                                             .requestFocus(
//                                                                 FocusNode());
//                                                         bottomBarController
//                                                             .update();
//                                                       },
//                                                       child: Container(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .only(
//                                                           bottom: 16,
//                                                         ),
//                                                         decoration:
//                                                             const BoxDecoration(
//                                                           border: Border(
//                                                             bottom: BorderSide(
//                                                                 color: ColorSchema
//                                                                     .black10Color,
//                                                                 width: 1),
//                                                           ),
//                                                         ),
//                                                         child: Row(
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .center,
//                                                           children: [
//                                                             profilePicWidget(
//                                                                 otherMember!,
//                                                                 channelList,
//                                                                 index),
//                                                             const SizedBox(
//                                                               width: 15,
//                                                             ),
//                                                             nameWidget(
//                                                                 otherMember,
//                                                                 channelList,
//                                                                 index),
//                                                             const SizedBox(
//                                                               width: 10,
//                                                             ),
//                                                             lastMessageAndMessageCountWidget(
//                                                                 channelList,
//                                                                 index)
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     );
//                                                   });
//                                             },
//                                           ),
//                                         ),
//                                 ],
//                               ),
//                             ),
//                           )
//                         : const Expanded(
//                             child: Center(
//                               child: CupertinoActivityIndicator(radius: 15),
//                             ),
//                           );
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Expanded nameWidget(
//       Member otherMember, List<Channel> channelList, int index) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             (channelList[index].name ?? "".toString()),
//             softWrap: false,
//             overflow: TextOverflow.ellipsis,
//             maxLines: 1,
//             style: const TextStyle().normal16.textColor(ColorSchema.blackColor),
//           ),
//           const SizedBox(height: 5),
//           StreamBuilder<Map<User, Event>>(
//             stream: channelList[index].state!.typingEventsStream,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 if (snapshot.data!.isNotEmpty) {
//                   return Text(
//                     "Typing...",
//                     style: const TextStyle()
//                         .errorText12
//                         .textColor(ColorSchema.greenColor),
//                   );
//                 }
//               }
//               return Text(
//                 channelList[index].state?.lastMessage?.text ?? "",
//                 overflow: TextOverflow.ellipsis,
//                 softWrap: false,
//                 maxLines: 1,
//                 style: const TextStyle()
//                     .errorText12
//                     .textColor(ColorSchema.black54Color),
//               );
//             },
//           )
//         ],
//       ),
//     );
//   }

//   Column lastMessageAndMessageCountWidget(
//       List<Channel> channelList, int index) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         Text(
//           DateUtilities().lastMessageAt(
//             date: (channelList[index].lastMessageAt ?? "").toString(),
//           ),
//           style:
//               const TextStyle().errorText12.textColor(ColorSchema.black54Color),
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         StreamBuilder<int>(
//             stream: channelList[index].state!.unreadCountStream,
//             builder: (context, snapshot) {
//               return (snapshot.data == 0 || snapshot.data == null)
//                   ? Container()
//                   : Container(
//                       // height: 20,
//                       // width: 20,
//                       padding: const EdgeInsets.all(5),
//                       decoration: const BoxDecoration(
//                           color: ColorSchema.redColor, shape: BoxShape.circle),
//                       child: Center(
//                         child: Text(
//                           snapshot.data.toString(),
//                           style: const TextStyle()
//                               .errorText12
//                               .textColor(ColorSchema.whiteColor),
//                         ),
//                       ),
//                     );
//             })
//       ],
//     );
//   }

//   Stack profilePicWidget(
//       Member? otherMember, List<Channel> channelList, int index) {
//     Member otherMember =
//         channelList[index].state!.members.firstWhere((element) {
//       return element.role == "owner";
//     });
//     return Stack(
//       alignment: Alignment.bottomRight,
//       children: [
//         // StreamChannel(
//         //   channel: channelList[index],
//         //   child: ChannelAvatar(
//         //     onTap: () {
//         //       showDialog(
//         //           context: context,
//         //           builder: (context) {
//         //             return AlertDialog(
//         //               titlePadding: const EdgeInsets.all(0),
//         //               buttonPadding: const EdgeInsets.all(0),
//         //               actionsPadding: const EdgeInsets.all(0),
//         //               contentPadding: const EdgeInsets.all(0),
//         //               insetPadding: const EdgeInsets.only(
//         //                   top: 200, bottom: 200, left: 0, right: 0),
//         //               content: StreamChannel(
//         //                   channel: channelList[index],
//         //                   child: ChannelAvatar(
//         //                     borderRadius: BorderRadius.circular(0),
//         //                     constraints: const BoxConstraints(
//         //                         minHeight: 100, minWidth: double.infinity),
//         //                   )),
//         //             );
//         //           });
//         //     },
//         //     channel: channelList[index],
//         //     borderRadius: BorderRadius.circular(30),
//         //     constraints: const BoxConstraints(
//         //       maxHeight: 50,
//         //       maxWidth: 50,
//         //       minHeight: 50,
//         //       minWidth: 50,
//         //     ),
//         //   ),
//         // ),
//         (!isNullEmptyOrFalse(otherMember.user?.image ?? ""))
//             ? Container(
//                 height: 50,
//                 width: 50,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: NetworkImage(otherMember.user!.image.toString()
//                         // otherMember!.user!.image.toString(),
//                         ),
//                   ),
//                 ),
//               )
//             : Container(
//                 height: 50,
//                 width: 50,
//                 decoration: const BoxDecoration(
//                   // color: ColorSchema.black10Color,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Center(
//                   child: SvgPicture.asset(
//                     ImageConstants.defaultUserIcon,
//                     height: 50,
//                     width: 50,
//                   ),
//                 ),
//               ),
//         // Container(
//         //   height: 15,
//         //   width: 15,
//         //   margin: const EdgeInsets.only(
//         //     left: 10,
//         //   ),
//         //   padding: const EdgeInsets.all(3),
//         //   decoration: const BoxDecoration(
//         //     color: ColorSchema.whiteColor,
//         //     shape: BoxShape.circle,
//         //   ),
//         //   child: Container(
//         //     padding: const EdgeInsets.all(2),
//         //     decoration: BoxDecoration(
//         //         color: (DateUtilities().timeAgoSinceDate(
//         //                     otherMember!.user!.lastActive.toString()) ==
//         //                 "Online")
//         //             ? ColorSchema.greenColor
//         //             : ColorSchema.black38Color,
//         //         shape: BoxShape.circle),
//         //   ),
//         // ),
//       ],
//     );
//   }

//   Container searchWidget() {
//     return Container(
//       height: 40,
//       margin: const EdgeInsets.only(top: 15, bottom: 15),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(
//           5,
//         ),
//       ),
//       child: CommonTextfield(
//         contentPadding: const EdgeInsets.only(
//           left: 10,
//           bottom: 5,
//         ),
//         ontap: () {},
//         cursorHeight: 17,
//         textOption: TextFieldOption(
//           prefixWid: Padding(
//             padding: const EdgeInsets.only(left: 10),
//             child: SvgPicture.asset(ImageConstants.searchIcon),
//           ),
//           hintStyleText:
//               const TextStyle().normal14.textColor(ColorSchema.black54Color),
//           border: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.circular(5),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.circular(5),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.circular(5),
//           ),
//           hintText: "Search for chats & messages",
//           fill: true,
//           fillColor: ColorSchema.black10Color,
//           inputController: bottomBarController.searchTextFieldController,
//         ),
//         textCallback: (val) {
//           if (scrollController.hasClients) {
//             scrollController.jumpTo(
//               0,
//             );
//           }
//         },
//         focusNode: bottomBarController.searchFocusNode,
//       ),
//     );
//   }

//   Row headerWidget() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           "All Chat",
//           style: const TextStyle().medium20.textColor(ColorSchema.blackColor),
//         ),
//         PopupMenuButton(
//           padding: const EdgeInsets.all(0),
//           color: ColorSchema.black10Color,
//           onSelected: (value) {
//             if (value == 3) {
//               Get.toNamed(Routes.profileScreen);
//             }
//           },
//           itemBuilder: (context) {
//             return [
//               PopupMenuItem(
//                 child: const Text("Select"),
//                 value: 1,
//                 textStyle: const TextStyle()
//                     .medium14
//                     .textColor(ColorSchema.blackColor),
//               ),
//               PopupMenuItem(
//                 child: const Text("Achieve Chat"),
//                 value: 2,
//                 textStyle: const TextStyle()
//                     .medium14
//                     .textColor(ColorSchema.blackColor),
//               ),
//               PopupMenuItem(
//                 child: const Text("Profile"),
//                 value: 3,
//                 textStyle: const TextStyle()
//                     .medium14
//                     .textColor(ColorSchema.blackColor),
//               ),
//               PopupMenuItem(
//                 child: const Text("Setting"),
//                 value: 4,
//                 textStyle: const TextStyle()
//                     .medium14
//                     .textColor(ColorSchema.blackColor),
//               ),
//             ];
//           },
//           child: SvgPicture.asset(ImageConstants.menuIcon),
//         ),
//       ],
//     );
//   }
// }
