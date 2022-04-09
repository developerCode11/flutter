import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jeevam_redesign/app/modules/upload_reports/upload_reports_controller.dart';
import 'package:jeevam_redesign/helper/utils/images.dart';
import 'package:jeevam_redesign/schemata/color_schema.dart';
import 'package:jeevam_redesign/schemata/text_style.dart';
import '../../../components/button/button.dart';
import '../../../components/common_header.dart';
import '../../routes/app_pages.dart';

class UploadDocumentsScreen extends StatelessWidget {
  UploadDocumentsScreen({Key? key}) : super(key: key);

  final uploadReportsController =
      Get.put<UploadReportsController>(UploadReportsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonHeader(title: "Upload Health Reports"),

              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                    "Kindly upload any available medical reports, test results or prescriptions related to your health condition",
                    textAlign: TextAlign.center,
                    style: TextStyle()
                        .normal14
                        .textColor(ColorSchema.black54Color)),
              ),
              SizedBox(
                height: 30,
              ),
              (uploadReportsController.images.isEmpty)
                  ? Text("Select Documents",
                      style: TextStyle()
                          .medium14
                          .textColor(ColorSchema.blackColor))
                  : Text("Selected Documents",
                      style: TextStyle()
                          .medium14
                          .textColor(ColorSchema.blackColor)),
              SizedBox(
                height: 10,
              ),
              imageWidget(),
              SizedBox(
                height: 10,
              ),
              // Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buttonWidget(),
    );
  }

  Flexible imageWidget() {
    return Flexible(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
        padding: EdgeInsets.all(15),
        constraints: BoxConstraints(
          minHeight: 300,
        ),
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
        child: (uploadReportsController.images.isEmpty)
            ? withOutImageWidget()
            : withImageWidget(),
      ),
    );
  }

  GridView withImageWidget() {
    return GridView.builder(
      itemCount: uploadReportsController.images.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 18,
        crossAxisSpacing: 18,
        mainAxisExtent: 120,
      ),
      itemBuilder: (contex, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: FileImage(uploadReportsController.images[index]),
                fit: BoxFit.fill),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  uploadReportsController.images.removeAt(index);
                },
                child: Container(
                  height: 16,
                  width: 16,
                  margin: EdgeInsets.only(top: 7, right: 7),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff5150A8),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.close,
                      size: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  InkWell withOutImageWidget() {
    return InkWell(
      onTap: () async {
        await ImagePicker()
            .pickImage(source: ImageSource.gallery)
            .then((value) {
          if (value != null) {
            uploadReportsController.images.add(File(value.path));
          }
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(ImageConstants.addDocuments),
          Text(
            "Tap to Upload Documents",
            style: TextStyle(decoration: TextDecoration.underline)
                .normal16
                .textColor(ColorSchema.blackColor),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Text(
              "Please select your documents related to reports",
              textAlign: TextAlign.center,
              style: TextStyle().normal14.textColor(ColorSchema.black54Color),
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonWidget() {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (uploadReportsController.images.isNotEmpty)
                Button(
                  isOutLine: true,
                  title: "+ Add More Documents",
                  buttonType: (uploadReportsController.images.isNotEmpty)
                      ? ButtonType.enable
                      : ButtonType.disable,
                  height: 50,
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
                title: "Upload Report",
                buttonType: (uploadReportsController.images.isNotEmpty)
                    ? ButtonType.enable
                    : ButtonType.disable,
                height: 50,
                onTap: () {
                  Get.toNamed(Routes.uploadProgressScreen);
                },
                textColor: ColorSchema.whiteColor,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
