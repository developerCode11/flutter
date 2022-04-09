import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeevam_redesign/schemata/text_style.dart';
import 'package:jeevam_redesign/schemata/color_schema.dart';

enum ButtonType { enable, disable, progress }

class Button extends StatelessWidget {
  final ButtonType buttonType;
  final Color? textColor;
  final double height;
  final bool? isOutLine;
  final String title;
  final Function? onTap;
  const Button({
    Key? key,
    this.textColor,
    this.isOutLine = false,
    this.buttonType = ButtonType.disable,
    this.onTap,
    this.title = "",
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color background = ColorSchema.primaryColor;
    switch (buttonType) {
      case ButtonType.enable:
        {
          background = ColorSchema.blackColor;
        }
        break;
      case ButtonType.disable:
        {
          background = ColorSchema.black10Color;
        }
        break;
      case ButtonType.progress:
        break;
    }
    return (isOutLine!)
        ? InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              onTap!();
            },
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(
                  15,
                ),
                border: Border.all(color: ColorSchema.black38Color),
              ),
              child: Center(
                  child: Text(
                title,
                style: const TextStyle().medium14.textColor(
                      textColor ?? ColorSchema.whiteColor,
                    ),
              )),
            ),
          )
        : Material(
            color: background,
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                if (ButtonType.enable == buttonType) onTap!();
              },
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (buttonType == ButtonType.progress)
                      const CupertinoActivityIndicator(
                        radius: 15,
                        // color: ColorSchema.whiteColor,
                      ),
                    if (buttonType != ButtonType.progress)
                      Text(
                        title,
                        style: const TextStyle().medium14.textColor(
                              buttonType == ButtonType.disable
                                  ? ColorSchema.black40Color
                                  : textColor ?? ColorSchema.whiteColor,
                            ),
                      ),
                  ],
                )),
              ),
            ),
          );
  }
}
