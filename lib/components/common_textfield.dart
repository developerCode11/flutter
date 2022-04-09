import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeevam_redesign/schemata/text_style.dart';
import 'package:jeevam_redesign/schemata/color_schema.dart';

// ignore: prefer_generic_function_type_aliases
typedef OnValidation(String? text);

// ignore: must_be_immutable
class CommonTextfield extends StatefulWidget {
  final TextFieldOption? textOption;
  final Function(String text)? textCallback;
  final VoidCallback? tapCallback;
  Function? ontap;
  final VoidCallback? onNextPress;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final double? cursorHeight;
  final bool? autoFocus;
  final OnValidation? validation;
  final TextStyle? hintStyleText;
  final EdgeInsetsGeometry? contentPadding;

  CommonTextfield({
    Key? key,
    @required this.textOption,
    @required this.textCallback,
    this.tapCallback,
    this.onNextPress,
    this.inputAction,
    this.autoFocus,
    this.focusNode,
    this.cursorHeight,
    this.ontap,
    this.contentPadding,
    this.validation,
    this.hintStyleText,
  }) : super(key: key);

  @override
  _CommonTextfieldState createState() => _CommonTextfieldState();
}

class _CommonTextfieldState extends State<CommonTextfield> {
  bool obscureText = false;
  IconData obscureIcon = Icons.visibility_off;

  @override
  void initState() {
    super.initState();
    obscureText = widget.textOption!.isSecureTextField ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // textAlignVertical: TextAlignVertical(y: 0.1),
      // autocorrect: widget.autoCorrect!,
      onTap: widget.ontap!() ?? () {},

      maxLines: widget.textOption!.maxLine,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      textInputAction: widget.inputAction ?? TextInputAction.done,
      focusNode: widget.focusNode,
      minLines: 1, cursorHeight: widget.cursorHeight,
      autofocus: widget.autoFocus ?? false,
      controller: widget.textOption!.inputController,
      obscureText: obscureText,
      style: const TextStyle().normal16.textColor(ColorSchema.blackColor),
      keyboardType: widget.textOption!.keyboardType ?? TextInputType.text,
      textCapitalization:
          widget.textOption!.textCapitalization ?? TextCapitalization.none,
      cursorColor: ColorSchema.blackColor,
      inputFormatters: widget.textOption!.formatter ?? [],
      decoration: InputDecoration(
          enabled: widget.textOption!.enabled!,
          filled: widget.textOption!.fill,
          fillColor: widget.textOption!.fillColor,
          contentPadding: widget.contentPadding ??
              const EdgeInsets.only(left: 15, right: 15),
          errorStyle:
              const TextStyle().errorText12.textColor(ColorSchema.redColor),
          errorMaxLines: 3,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: ColorSchema.black10Color, width: 1),
          ),
          enabledBorder: widget.textOption!.enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    BorderSide(color: ColorSchema.black10Color, width: 1),
              ),
          focusedBorder: widget.textOption!.focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: ColorSchema.primaryColor,
                  width: 1,
                ),
              ),
          border: widget.textOption!.border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    BorderSide(color: ColorSchema.black10Color, width: 1),
              ),
          hintStyle: (widget.textOption!.hintStyleText != null)
              ? widget.textOption!.hintStyleText
              : const TextStyle().normal16.textColor(ColorSchema.black54Color),
          hintText: widget.textOption!.hintText,
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 20,
            // maxWidth: 30,
            minWidth: 20,
            minHeight: 20,
          ),

          // prefixIconColor: (widget.focusNode!.hasFocus)
          //     ? ColorSchema.primaryColor
          //     : ColorSchema.blackColor,
          prefixIcon: (widget.textOption!.prefixWid != null)
              ? Padding(
                  padding: const EdgeInsets.only(right: 10, left: 0),
                  child: widget.textOption!.prefixWid,
                )
              : null,
          suffixIcon: (widget.textOption!.suffixWid != null)
              ? widget.textOption!.suffixWid
              : (widget.textOption!.isSecureTextField != null &&
                      widget.textOption!.isSecureTextField!)
                  ? IconButton(
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      icon: Icon(
                        obscureIcon,
                        size: 20,
                        color: ColorSchema.blackColor,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            obscureText = !obscureText;
                            if (obscureText) {
                              obscureIcon = Icons.visibility_off;
                            } else {
                              obscureIcon = Icons.visibility;
                            }
                          },
                        );
                        //TextInputConnection;
                      },
                    )
                  : null),

      onFieldSubmitted: (String text) {
        widget.textCallback!(text);
        FocusScope.of(context).unfocus();
        if (widget.onNextPress != null) {
          widget.onNextPress!();
        }
      },
      validator: (text) {
        return widget.validation!(text!);
      },
      onChanged: (String text) {
        widget.textCallback!(text);
        setState(() {});
      },
      onEditingComplete: () {
        // widget.textCallback!(widget.textOption?.inputController?.text ?? "");
      },
    );
  }
}

class TextFieldOption {
  String? labelText;
  String? hintText;
  bool? isSecureTextField = false;
  TextInputType? keyboardType;
  int? maxLine;
  int? maxLength;
  TextStyle? hintStyleText;
  Widget? prefixWid;
  Widget? suffixWid;
  Color? fillColor;
  InputBorder? enabledBorder;
  InputBorder? focusedBorder;
  InputBorder? border;
  bool? enabled;
  bool? fill;
  Widget? postfixWid;
  List<TextInputFormatter>? formatter;
  TextEditingController? inputController;
  TextCapitalization? textCapitalization;

  TextFieldOption(
      {this.labelText,
      this.hintText,
      this.isSecureTextField,
      this.keyboardType,
      this.maxLine = 1,
      this.enabled = true,
      this.fill = false,
      this.fillColor,
      this.suffixWid,
      this.enabledBorder,
      this.focusedBorder,
      this.border,
      this.formatter,
      this.maxLength = 1,
      this.hintStyleText,
      this.inputController,
      this.prefixWid,
      this.postfixWid,
      this.textCapitalization});
}
