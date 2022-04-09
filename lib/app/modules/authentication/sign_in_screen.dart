// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:jhclinicapp/app/modules/authentication/authentication_controller.dart';
// import 'package:jhclinicapp/components/button/button.dart';
// import 'package:jhclinicapp/components/common_textfield.dart';
// import 'package:jhclinicapp/helper/utils/common_functions.dart';
// import 'package:jhclinicapp/helper/utils/images.dart';
// import 'package:jhclinicapp/schemata/color_schema.dart';
// import 'package:jhclinicapp/schemata/text_style.dart';

// class SignInScreen extends StatelessWidget {
//   SignInScreen({Key? key}) : super(key: key);
//   final authenticationController = Get.put(AuthenticationController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(
//           left: 20,
//           right: 20,
//           bottom: 30,
//         ),
//         child: Text.rich(
//           TextSpan(
//               text: "By Singning In, you’re agree to our ",
//               style: const TextStyle().normal14.textColor(
//                     ColorSchema.black54Color,
//                   ),
//               children: [
//                 TextSpan(
//                   text: "Terms & Conditions",
//                   style: const TextStyle().normal14.textColor(
//                         ColorSchema.blackColor,
//                       ),
//                 ),
//                 TextSpan(
//                   text: " and ",
//                   style: const TextStyle().normal14.textColor(
//                         ColorSchema.black54Color,
//                       ),
//                 ),
//                 TextSpan(
//                   text: "Privacy Policy",
//                   style: const TextStyle().normal14.textColor(
//                         ColorSchema.blackColor,
//                       ),
//                 ),
//               ]),
//           textAlign: TextAlign.center,
//         ),
//       ),
//       resizeToAvoidBottomInset: true,
//       body: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus();
//         },
//         child: GetBuilder(
//           init: AuthenticationController(),
//           builder: (controller) => Padding(
//             padding: EdgeInsets.only(
//               top: MediaQuery.of(context).padding.top,
//               left: 20,
//               right: 20,
//               bottom: 10,
//             ),
//             child: SizedBox(
//               width: double.infinity,
//               child: Obx(
//                 () => Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   // mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: SingleChildScrollView(
//                         physics: const BouncingScrollPhysics(),
//                         child: Column(
//                           children: [
//                             const SizedBox(
//                               height: 50,
//                             ),
//                             SvgPicture.asset(ImageConstants.authLogo),
//                             const SizedBox(
//                               height: 40,
//                             ),
//                             Text(
//                               "Sign In",
//                               style: const TextStyle()
//                                   .medium20
//                                   .textColor(ColorSchema.blackColor),
//                             ),
//                             const SizedBox(
//                               height: 55,
//                             ),
//                             SizedBox(
//                               height: 35,
//                               child: CommonTextfield(
//                                 contentPadding:
//                                     const EdgeInsets.only(bottom: 12),
//                                 textOption: TextFieldOption(
//                                   prefixWid: SvgPicture.asset(
//                                     ImageConstants.emailIcon,
//                                     color: (authenticationController
//                                             .emailFocusNode.hasFocus)
//                                         ? ColorSchema.primaryColor
//                                         : ColorSchema.black54Color,
//                                   ),
//                                   hintText: "Enter email id",
//                                   inputController:
//                                       authenticationController.emailController,
//                                 ),
//                                 focusNode:
//                                     authenticationController.emailFocusNode,
//                                 textCallback: (val) {
//                                   authenticationController.getButtonType();
//                                 },
//                                 ontap: () {
//                                   authenticationController.update();
//                                 },
//                               ),
//                             ),
//                             if (!isNullEmptyOrFalse(
//                                 authenticationController.invalidEmail.value))
//                               Column(
//                                 children: [
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   Align(
//                                     alignment: Alignment.centerLeft,
//                                     child: Text(
//                                       authenticationController
//                                           .invalidEmail.value,
//                                       style: const TextStyle()
//                                           .errorText12
//                                           .textColor(ColorSchema.redColor),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             const SizedBox(
//                               height: 32,
//                             ),
//                             SizedBox(
//                               height: 35,
//                               child: CommonTextfield(
//                                 contentPadding:
//                                     const EdgeInsets.only(bottom: 12),
//                                 textOption: TextFieldOption(
//                                   prefixWid: SvgPicture.asset(
//                                     ImageConstants.passWordIcon,
//                                     color: (authenticationController
//                                             .passwordFocusNode.hasFocus)
//                                         ? ColorSchema.primaryColor
//                                         : ColorSchema.black54Color,
//                                   ),
//                                   hintText: "Enter Password",
//                                   isSecureTextField: true,
//                                   inputController: authenticationController
//                                       .passWordController,
//                                 ),
//                                 focusNode:
//                                     authenticationController.passwordFocusNode,
//                                 textCallback: (val) {
//                                   authenticationController.getButtonType();
//                                 },
//                                 ontap: () {
//                                   authenticationController.update();
//                                 },
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 8,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   authenticationController.wrongPassword.value,
//                                   style: const TextStyle()
//                                       .errorText12
//                                       .textColor(ColorSchema.redColor),
//                                 ),
//                                 const Spacer(),
//                                 Text(
//                                   "Forgot password?",
//                                   style: const TextStyle()
//                                       .normal14
//                                       .textColor(ColorSchema.black54Color),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 40,
//                             ),
//                             Button(
//                               onTap: () async {
//                                 await authenticationController
//                                     .apicallForLogin();
//                               },
//                               title: "Sign in",
//                               buttonType:
//                                   authenticationController.buttonType.value,
//                             ),
//                             // const Spacer(),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
