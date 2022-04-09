// // ignore_for_file: avoid_print

// import '../../routes/app_pages.dart';
// import '../models/notification/notification_model.dart';

// // Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
// //   print("Handling a background message");
// //   print("BackGround Message Message" + message.data.toString());
// // }

// class NotificaionController extends GetxController {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   AndroidNotificationChannel channel = const AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications',
//     description: "High importance description", // title
//     importance: Importance.high,
//     playSound: true,
//   );

//   intializeFirebase() async {
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//     // var initializationSettingsAndroid =
//     //     const AndroidInitializationSettings('@mipmap/launcher_icon');
//     // var initializationSettingsIOS = const IOSInitializationSettings();
//     // var initializationSettings = InitializationSettings(
//     //     android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//     // flutterLocalNotificationsPlugin.initialize(
//     //   initializationSettings,
//     // );

//     FirebaseMessaging.onMessage.listen((event) {
//       print("Get On message " + event.data.toString());
//     });

//     FirebaseMessaging.instance
//         .getInitialMessage()
//         .then((RemoteMessage? message) {
//       if (!isNullEmptyOrFalse(message)) {
//         print("Get Initial Message " + message!.data.toString());
//         Data data = Data.fromJson(message.data);

//         if (data.channel!.type == NotificationConsumerType.MESSAGING) {
//           client.state.channels.forEach((key, value) {
//             if (value.id == data.channel!.id) {
//               Get.toNamed(
//                 Routes.privateChatScreen,
//                 arguments: value,
//               );
//             }
//           });
//         }
//       }
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print("On Message Open App " + message.data.toString());

//       Data data = Data.fromJson(message.data);
//       if (data.channel!.type == NotificationConsumerType.MESSAGING) {
//         client.state.channels.forEach((key, value) {
//           if (value.id == data.channel!.id) {
//             Get.toNamed(
//               Routes.privateChatScreen,
//               arguments: value,
//             );
//           }
//         });
//       }
//     });
//   }
// }
