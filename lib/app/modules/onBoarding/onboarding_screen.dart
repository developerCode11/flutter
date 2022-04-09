// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:jhclinicapp/components/button/button.dart';
// import 'package:jhclinicapp/helper/utils/images.dart';
// import 'package:jhclinicapp/schemata/color_schema.dart';
// import 'package:jhclinicapp/schemata/text_style.dart';

// import '../../routes/app_pages.dart';

// class OnBoradingScreen extends StatelessWidget {
//   OnBoradingScreen({Key? key}) : super(key: key);

//   final RxInt currentPage = 0.obs;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.only(
//           top: MediaQuery.of(context).padding.top,
//         ),
//         child: Obx(() => Column(
//               children: [
//                 (currentPage.value != 2)
//                     ? InkWell(
//                         onTap: () {
//                           Get.offAllNamed(Routes.signIn);
//                         },
//                         child: Align(
//                           alignment: Alignment.centerRight,
//                           child: Padding(
//                             padding: const EdgeInsets.only(right: 20),
//                             child: Text(
//                               "Skip",
//                               style: const TextStyle()
//                                   .normal14
//                                   .textColor(ColorSchema.black54Color),
//                             ),
//                           ),
//                         ),
//                       )
//                     : InkWell(
//                         onTap: () {},
//                         child: Align(
//                           alignment: Alignment.centerRight,
//                           child: Padding(
//                             padding: const EdgeInsets.only(right: 20),
//                             child: Text(
//                               "Skip",
//                               style: const TextStyle()
//                                   .normal14
//                                   .textColor(ColorSchema.whiteColor),
//                             ),
//                           ),
//                         ),
//                       ),
//                 const SizedBox(
//                   height: 135,
//                 ),
//                 Expanded(
//                   child: PageView(
//                     onPageChanged: (value) {
//                       currentPage.value = value;
//                     },
//                     children: [
//                       getViewWidget(
//                           image: ImageConstants.onBoarding1,
//                           title: "Lorem Ipsum Doret",
//                           subTitle:
//                               "Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt"),
//                       getViewWidget(
//                           image: ImageConstants.onBoarding2,
//                           title: "Lorem Ipsum Doret",
//                           subTitle:
//                               "Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt"),
//                       getViewWidget(
//                           image: ImageConstants.onBoarding3,
//                           title: "Lorem Ipsum Doret",
//                           subTitle:
//                               "Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt"),
//                     ],
//                   ),
//                 ),
//                 getDottedPageControl(),
//                 if (currentPage.value == 2)
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 25, right: 25, top: 40, bottom: 0),
//                     child: Button(
//                       buttonType: ButtonType.enable,
//                       height: 50,
//                       onTap: () {
//                         Get.offAllNamed(Routes.signIn);
//                       },
//                       title: "Sign in",
//                     ),
//                   ),
//                 SizedBox(
//                   height: currentPage.value == 2 ? 30 : 120,
//                 ),
//               ],
//             )),
//       ),
//     );
//   }

//   Widget getViewWidget({String? title, String? subTitle, String? image}) {
//     return Column(
//       children: [
//         SizedBox(height: 325, child: SvgPicture.asset(image!)),
//         Padding(
//           padding: EdgeInsets.only(
//             top: (MediaQuery.of(Get.context!).size.height * 0.02) + 50,
//             left: 20,
//             right: 20,
//           ),
//           child: Column(
//             children: [
//               Text(
//                 title!,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle().medium20.textColor(
//                       ColorSchema.blackColor,
//                     ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Text(
//                 subTitle!,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle()
//                     .normal14
//                     .textColor(ColorSchema.black54Color),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget getDottedPageControl() {
//     return DotsIndicator(
//       dotsCount: 3,
//       position: currentPage.value.toDouble(),
//       decorator: DotsDecorator(
//         spacing: const EdgeInsets.only(right: 8),
//         color: ColorSchema.chatBackGround,
//         size: const Size(6, 6),
//         activeSize: const Size(20.0, 6.0),
//         activeShape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//         activeColor: ColorSchema.blackColor,
//       ),
//     );
//   }
// }
