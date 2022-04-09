import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jeevam_redesign/app/modules/upload_reports/upload_reports_controller.dart';
import 'package:jeevam_redesign/components/common_textfield.dart';
import 'package:jeevam_redesign/helper/utils/images.dart';
import 'package:jeevam_redesign/schemata/text_style.dart';
import 'package:lottie/lottie.dart';
import '../../../components/button/button.dart';
import '../../../components/common_header.dart';
import '../../../components/customBlurWidget.dart';
import '../../../schemata/color_schema.dart';
import '../../routes/app_pages.dart';

class UploadProgressScreen extends StatelessWidget {
  UploadProgressScreen({Key? key}) : super(key: key);
  final uploadReportsController =
      Get.put<UploadReportsController>(UploadReportsController());
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 5), (val) {
      uploadReportsController.isShowDoneLoader.value =
          !uploadReportsController.isShowDoneLoader.value;
      val.cancel();
    });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonHeader(title: "Upload Health Reports"),
            SizedBox(
              height: 30,
            ),
            loadingAndSuccessWidget(),
            SizedBox(
              height: 10,
            ),
            documentsListWidget(),
            buttonWidget(),
          ],
        ),
      ),
    );
  }

  Widget buttonWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 10,
        ),
        Button(
          title: "+ Add More Documents",
          buttonType: ButtonType.enable,
          height: 50,
          isOutLine: true,
          onTap: () async {
            await ImagePicker()
                .pickImage(source: ImageSource.gallery)
                .then((value) {
              if (value != null) {
                uploadReportsController.images.add(File(value.path));
              }
            });
          },
          textColor: ColorSchema.black54Color,
        ),
        SizedBox(
          height: 15,
        ),
        Button(
          title: "Proceed",
          buttonType: ButtonType.enable,
          height: 50,
          onTap: () {
            bottomSheetWidget();
          },
          textColor: ColorSchema.whiteColor,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Future<dynamic> bottomSheetWidget() {
    return showModalBottomSheet(
        isScrollControlled: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        context: Get.context!,
        builder: (contex) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
            child: SizedBox(
              height: 370,
              child: CustomBlur(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  child: Column(
                    children: [
                      Container(
                        height: 5,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: ColorSchema.black20Color),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Please share additional details ",
                        style: TextStyle()
                            .medium20
                            .textColor(ColorSchema.blackColor),
                      ),
                      SizedBox(
                        height: 34,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Name of your report",
                          style: TextStyle()
                              .errorText12
                              .textColor(ColorSchema.black38Color),
                        ),
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(top: 5, bottom: 25),
                        child: CommonTextfield(
                          textOption: TextFieldOption(
                              hintText: "Enter name",
                              inputController: uploadReportsController
                                  .nameTextEditingController),
                          textCallback: (val) {
                            uploadReportsController.update();
                          },
                          ontap: () {},
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "When did you conduct the test?",
                          style: TextStyle()
                              .errorText12
                              .textColor(ColorSchema.black38Color),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                          WidgetsBinding.instance!
                              .addPostFrameCallback((timeStamp) {
                            dateSelectWidget();
                          });
                        },
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.only(top: 5, bottom: 25),
                          child: CommonTextfield(
                            textOption: TextFieldOption(
                                suffixWid: Icon(Icons.calendar_month),
                                enabled: false,
                                hintText: "DD / MM / YYYY",
                                inputController: uploadReportsController
                                    .dateTextEditingController),
                            textCallback: (val) {},
                            ontap: () {},
                          ),
                        ),
                      ),
                      Spacer(),
                      GetBuilder(
                        init: UploadReportsController(),
                        builder: (controller) {
                          return Button(
                            title: "Submit Report",
                            buttonType: (uploadReportsController
                                        .dateTextEditingController
                                        .text
                                        .isNotEmpty &&
                                    uploadReportsController
                                        .nameTextEditingController 
                                        .text
                                        .isNotEmpty)
                                ? ButtonType.enable
                                : ButtonType.disable,
                            height: 50,
                            onTap: () async {
                              Get.toNamed(
                                  Routes.successfullyUploadDocumentsScreen);
                            },
                            textColor: ColorSchema.whiteColor,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Future<dynamic> dateSelectWidget() {
    return showModalBottomSheet(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      context: Get.context!,
      builder: (context) {
        return Container(
          height: 370,
          child: CustomBlur(
            child: Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: ColorSchema.black20Color),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Day",
                        style: TextStyle()
                            .medium14
                            .textColor(ColorSchema.blackColor),
                      ),
                      Text(
                        "Month",
                        style: TextStyle()
                            .medium14
                            .textColor(ColorSchema.blackColor),
                      ),
                      Text(
                        "Year",
                        style: TextStyle()
                            .medium14
                            .textColor(ColorSchema.blackColor),
                      ),
                    ],
                  ),
                  Expanded(
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      dateOrder: DatePickerDateOrder.dmy,
                      onDateTimeChanged: (value) {
                        uploadReportsController.date = value;
                      },
                    ),
                  ),
                  Button(
                    title: "Save",
                    buttonType: ButtonType.enable,
                    height: 50,
                    onTap: () async {
                      uploadReportsController.dateTextEditingController.text =
                          uploadReportsController.date.day.toString() +
                              "/" +
                              uploadReportsController.date.month.toString() +
                              "/" +
                              uploadReportsController.date.year.toString();
                      Get.back();
                      bottomSheetWidget();
                    },
                    textColor: ColorSchema.whiteColor,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Expanded documentsListWidget() {
    return Expanded(
      child: Obx(
        () => ListView.separated(
          shrinkWrap: true,
          itemCount: uploadReportsController.images.length,
          physics: BouncingScrollPhysics(),
          separatorBuilder: (contex, index) {
            return SizedBox(
              height: 10,
            );
          },
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: (index == 0)
                    ? ColorSchema.greenColor.withOpacity(0.05)
                    : (index == 1)
                        ? ColorSchema.greenColor.withOpacity(0.05)
                        : (index == 2)
                            ? ColorSchema.yellowColor.withOpacity(0.05)
                            : ColorSchema.redColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    ImageConstants.fileIcon,
                    color: (index == 0)
                        ? ColorSchema.greenColor
                        : (index == 1)
                            ? ColorSchema.greenColor
                            : (index == 2)
                                ? ColorSchema.yellowColor
                                : ColorSchema.redColor,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(uploadReportsController.images[index].path),
                      Text(
                        "PDF_2022-48721.jpg",
                        style: TextStyle().normal14.textColor(
                              ColorSchema.blackColor,
                            ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: "Uploading : ",
                          style: TextStyle().errorText12.textColor(
                                ColorSchema.blackDarkColor,
                              ),
                          children: [
                            TextSpan(
                              text: (index == 0)
                                  ? "Successfully"
                                  : (index == 1)
                                      ? "35%"
                                      : (index == 2)
                                          ? "40%"
                                          : "50%",
                              style: TextStyle().errorText12.textColor(
                                    (index == 0)
                                        ? ColorSchema.greenColor
                                        : (index == 1)
                                            ? ColorSchema.greenColor
                                            : (index == 2)
                                                ? ColorSchema.yellowColor
                                                : ColorSchema.redColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(
                              color: (index == 0)
                                  ? ColorSchema.greenColor
                                  : (index == 1)
                                      ? ColorSchema.greenColor
                                      : (index == 2)
                                          ? ColorSchema.yellowColor
                                          : ColorSchema.redColor,
                            )),
                        child: Center(
                          child: Icon(
                            (index == 0)
                                ? Icons.done
                                : (index == 1)
                                    ? Icons.pause
                                    : (index == 2)
                                        ? Icons.play_arrow
                                        : Icons.error,
                            color: (index == 0)
                                ? ColorSchema.greenColor
                                : (index == 1)
                                    ? ColorSchema.greenColor
                                    : (index == 2)
                                        ? ColorSchema.yellowColor
                                        : ColorSchema.redColor,
                            size: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          uploadReportsController.images.removeAt(index);
                        },
                        child: Icon(
                          Icons.close,
                          size: 20,
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Container loadingAndSuccessWidget() {
    return Container(
      height: 200,
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: Offset(1, 2),
              blurRadius: 4,
              color: Colors.black.withOpacity(0.1),
            )
          ],
          border: Border.all(color: Color(0xffE6EAEC), width: 1)),
      child: Column(
        children: [
          Obx(() => Container(
                height: 100,
                width: 100,
                child: Lottie.asset(
                    (uploadReportsController.isShowDoneLoader.value)
                        ? ImageConstants.uploadDone
                        : ImageConstants.loaderLottie),
              )),
          Text(
            "4 Documents Attached",
            style: TextStyle(
                color: Color(0xff002839),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Proceed to save the documents",
            style: TextStyle(
                color: Color(0xff758B94),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
