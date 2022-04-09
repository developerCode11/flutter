// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:jhclinicapp/app/modules/chat/chat_user_list.dart';
// import 'package:jhclinicapp/schemata/color_schema.dart';
// import 'package:stream_chat_flutter/stream_chat_flutter.dart';

// import '../../../helper/utils/images.dart';

// class ThreadPage extends StatelessWidget {
//   final Message? parent;

//   const ThreadPage({
//     Key? key,
//     this.parent,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: ThreadHeader(
//         parent: parent!,
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 10, right: 10),
//               child: MessageListView(
//                 spacingWidgetBuilder: (context, spacingTypes) {
//                   return const Padding(
//                     padding: EdgeInsets.only(top: 8, right: 0, left: 0),
//                   );
//                 },
//                 paginationLoadingIndicatorBuilder: (context) {
//                   return const CupertinoActivityIndicator(
//                     radius: 15,
//                     // color: ColorSchema.blackColor,
//                   );
//                 },
//                 loadingBuilder: (context) {
//                   return const CupertinoActivityIndicator(
//                     radius: 15,
//                     // color: ColorSchema.whiteColor,
//                   );
//                 },
//                 messageHighlightColor: ColorSchema.redColor,
//                 initialAlignment: 0,
//                 parentMessage: parent,
//                 parentMessageBuilder:
//                     (context, messageList, defaultMessageWidget) {
//                   return defaultMessageWidget.copyWith(
//                     attachmentBorderSide: BorderSide.none,
//                     attachmentBorderRadiusGeometry: BorderRadius.circular(5),
//                     attachmentShape: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.circular(5)),
//                     attachmentPadding: const EdgeInsets.all(0),

//                     borderSide: BorderSide.none,
//                     borderRadiusGeometry: BorderRadius.circular(12),
//                     padding: const EdgeInsets.all(0),
//                     showUserAvatar: DisplayWidget.gone,
//                     showReplyMessage: true,
//                     showCopyMessage: true,
//                     showEditMessage: false,
//                     showPinButton: true,
//                     showFlagButton: true,
//                     // showInChannelIndicator: true,
//                     showResendMessage: true,
//                     showSendingIndicator: true,
//                     showPinHighlight: true,
//                     showReactions: true,
//                     showUsername: true,
//                     showDeleteMessage: false,
//                     userAvatarBuilder: (val, user) {
//                       return Container();
//                     },
//                   );
//                 },
//                 messageBuilder:
//                     (context, details, messageList, defaultMessageWidget) {
//                   return defaultMessageWidget.copyWith(
//                     attachmentBorderSide: BorderSide.none,
//                     attachmentBorderRadiusGeometry: BorderRadius.circular(5),
//                     attachmentShape: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.circular(5)),
//                     attachmentPadding: const EdgeInsets.all(0),
//                     borderSide: BorderSide.none,
//                     borderRadiusGeometry: BorderRadius.circular(12),
//                     padding: const EdgeInsets.all(0),
//                     showUserAvatar: DisplayWidget.gone,
//                     showReplyMessage: true,
//                     showCopyMessage: true,
//                     showEditMessage: details.isMyMessage,
//                     showPinButton: true,
//                     showFlagButton: true,
//                     // showInChannelIndicator: true,
//                     showResendMessage: true,
//                     showSendingIndicator: true,
//                     showPinHighlight: true,
//                     showReactions: true,
//                     showUsername: true,
//                     showDeleteMessage: details.isMyMessage,
//                     userAvatarBuilder: (val, user) {
//                       return Container();
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//           Container(
//             alignment: Alignment.topCenter,
//             child: MessageInput(
//                 shouldKeepFocusAfterMessage: true,
//                 activeSendButton: Container(
//                   margin: const EdgeInsets.only(left: 10, right: 25),
//                   height: 50,
//                   width: 50,
//                   decoration: const BoxDecoration(
//                     color: ColorSchema.primaryColor,
//                     shape: BoxShape.circle,
//                   ),
//                   child:
//                       Center(child: SvgPicture.asset(ImageConstants.sendIcon)),
//                 ),
//                 idleSendButton: Container(
//                   margin: const EdgeInsets.only(left: 10, right: 25),
//                   height: 50,
//                   width: 50,
//                   decoration: const BoxDecoration(
//                     color: ColorSchema.black10Color,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Center(
//                       child: SvgPicture.asset(
//                     ImageConstants.sendIcon,
//                     color: ColorSchema.chatBackGround,
//                   )),
//                 ),

//                 // ignore: deprecated_member_use
//                 mentionsTileBuilder: (_, member) =>
//                     // ignore: deprecated_member_use
//                     member.user!.id != client.state.user!.id
//                         // ignore: deprecated_member_use
//                         ? MentionTile(
//                             member,
//                             subtitle: Container(),
//                           )
//                         : Container(),
//                 showCommandsButton: false,
//                 parentMessage: parent),
//           ),
//         ],
//       ),
//     );
//   }
// }
