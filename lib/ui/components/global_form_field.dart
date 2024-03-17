import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_cask/utils/colors.dart';
import 'package:one_cask/utils/helpers.dart';
import 'package:one_cask/utils/size_config.dart';
import 'package:one_cask/utils/text_styles.dart';

class GlobalFormField extends StatefulWidget {
  final TextInputType keyBoardType;
  final String? prefixIcon, suffixIcon, counterText, titleText, hintText;
  final TextEditingController? textController;
  final int maxLength, textLength, maxLines;
  final bool isAutoFocus, isFilled;

  final Widget? prefixWidget, suffixWidget;
  final Color? fillColor;
  final TextAlign textAlign;
  final void Function(String)? onChanged;
  final bool? isConfirmedPassword;
  final AutovalidateMode? autoValidateMode;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;

  const GlobalFormField(
      {Key? key,
      this.hintText,
      required this.keyBoardType,
      this.textController,
      this.prefixIcon,
      this.suffixIcon,
      this.counterText,
      this.focusNode,
      this.isFilled = false,
      this.maxLines = 1,
      this.prefixWidget,
      this.suffixWidget,
      this.titleText,
      this.validator,
      this.autoValidateMode,
      this.isConfirmedPassword = true,
      this.fillColor,
      this.textAlign = TextAlign.start,
      this.borderColor,
      this.inputFormatters,
      this.onChanged,
      this.isAutoFocus = false,
      this.textLength = 100,
      this.maxLength = 35})
      : super(key: key);

  @override
  State<GlobalFormField> createState() => _GlobalFormFieldState();
}

class _GlobalFormFieldState extends State<GlobalFormField> {
  late bool obscureText;

  @override
  void initState() {
    obscureText = TextInputType.visiblePassword == widget.keyBoardType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.titleText != null) ...[
          Text(widget.titleText!, style: regularText()),
          globalGap(1.5)
        ],
        TextFormField(
          onChanged: widget.onChanged,
          focusNode: widget.focusNode,
          controller: widget.textController,
          obscureText: obscureText,
          obscuringCharacter: '*',
          maxLines: widget.maxLines,
          keyboardType: widget.keyBoardType,
          autofocus: widget.isAutoFocus,
          textAlign: widget.textAlign,
          autovalidateMode:
              widget.autoValidateMode ?? AutovalidateMode.onUserInteraction,
          inputFormatters: widget.inputFormatters ??
              [
                if (widget.keyBoardType == TextInputType.phone)
                  LengthLimitingTextInputFormatter(widget.maxLength),
                if (widget.keyBoardType == TextInputType.phone)
                  FilteringTextInputFormatter.digitsOnly,
                if (widget.keyBoardType == TextInputType.name)
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
          style: regularText(),
          decoration: InputDecoration(
            counterText: widget.counterText,
            prefixIcon: widget.prefixWidget ??
                (widget.prefixIcon == null
                    ? null
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.5.heightAdjusted,
                            horizontal: 2.5.widthAdjusted),
                        child: SvgPicture.asset(widget.prefixIcon!))),
            suffixIcon: widget.suffixWidget ??
                (TextInputType.visiblePassword == widget.keyBoardType
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color:  obscureText ? Colors.grey.shade400 : kSecondaryColor,
                        ))
                    : widget.suffixIcon == null
                        ? null
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.heightAdjusted,
                                horizontal: 2.5.widthAdjusted),
                            child: SvgPicture.asset(widget.suffixIcon!))),
            hintText: widget.hintText,
            hintStyle: regularText(color: Colors.black.withAlpha(130)),
            contentPadding: EdgeInsets.symmetric(
                vertical: 3.5.heightAdjusted, horizontal: 3.heightAdjusted),
            border: InputBorder.none,
            filled: widget.isFilled,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                // borderSide:
                //     BorderSide(color: widget.borderColor ?? kTextFieldStroke)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kPrimaryColor.withAlpha(100))),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: kPrimaryColor.withAlpha(100)),
            ),
          ),
          validator: widget.validator ??
              (value) {
                if (value!.isEmpty) {
                  return 'This input is empty';
                } else if (widget.keyBoardType == TextInputType.emailAddress) {
                  if (!isValidEmail(value)) {
                    return 'Not a valid email';
                  }
                } else if (widget.keyBoardType == TextInputType.name) {
                  if (value.length < 3) {
                    return 'Not a valid name';
                  }
                } else if (widget.keyBoardType ==
                    TextInputType.visiblePassword) {
                  if (widget.isConfirmedPassword != null) {
                    if (!widget.isConfirmedPassword!) {
                      return "Passwords don't match";
                    }
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  } else if (!value.contains(RegExp(r'[0-9]')) ||
                      !value.contains(RegExp(r'[A-Z]', caseSensitive: false))) {
                    return 'Password must contain numbers and letters';
                  }
                }
                return null;
              },
        )
      ],
    );
  }
}
