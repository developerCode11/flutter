import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jeevam_redesign/schemata/text_style.dart';

import '../schemata/color_schema.dart';

class CommonHeader extends StatelessWidget {
  final String? title;
  CommonHeader({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: SvgPicture.asset("assets/backIcon.svg"),
        ),
        Spacer(),
        Text(title!,
            style: TextStyle().medium20.textColor(ColorSchema.blackColor)),
        Spacer(),
      ],
    );
  }
}
