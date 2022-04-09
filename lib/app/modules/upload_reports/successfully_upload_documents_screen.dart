import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jeevam_redesign/app/modules/upload_reports/upload_reports_controller.dart';
import 'package:jeevam_redesign/components/button/button.dart';
import 'package:jeevam_redesign/helper/utils/images.dart';
import 'package:jeevam_redesign/schemata/color_schema.dart';
import 'package:lottie/lottie.dart';
import 'package:jeevam_redesign/schemata/text_style.dart';
import '../../routes/app_pages.dart';

class SuccessFullyUploadDocumentsScreen extends StatelessWidget {
  SuccessFullyUploadDocumentsScreen({Key? key}) : super(key: key);
  final uploadReportsController =
      Get.put<UploadReportsController>(UploadReportsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              successWidget(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Successfully saved 4 Documents",
                style: TextStyle().medium20.textColor(ColorSchema.blackColor),
              ),
              documentsListWidget(),
              buttonWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Column buttonWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 8),
          child: Text(
            "Have more reports?",
            style: TextStyle().normal14.textColor(ColorSchema.black54Color),
          ),
        ),
        Button(
          title: "Upload Another Report",
          buttonType: ButtonType.enable,
          height: 50,
          onTap: () {},
          textColor: ColorSchema.whiteColor,
        ),
        Container(
          margin: EdgeInsets.only(top: 16, bottom: 16),
          child: Text(
            "OR",
            style: TextStyle().normal16.textColor(ColorSchema.black54Color),
          ),
        ),
        Button(
          title: "Go Back Home",
          buttonType: ButtonType.enable,
          height: 50,
          onTap: () {
            Get.offAllNamed(Routes.uploadDocumentsScreen);
            Get.deleteAll();
          },
          textColor: ColorSchema.whiteColor,
        ),
        SizedBox(
          height: 20,
        ),
      ],
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
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: ColorSchema.greenColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SvgPicture.asset(
                    ImageConstants.fileIcon,
                    color: ColorSchema.greenColor,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(uploadReportsController.images[index].path
                          .substring(0, 10)),
                    ],
                  )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(
                            color: ColorSchema.greenColor,
                          )),
                      child: Center(
                        child: Icon(
                          Icons.done,
                          color: ColorSchema.greenColor,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Container successWidget() {
    return Container(
      height: 170,
      width: 170,
      child: Lottie.asset(
        ImageConstants.uploadDone2,
        fit: BoxFit.fill,
      ),
    );
  }
}
