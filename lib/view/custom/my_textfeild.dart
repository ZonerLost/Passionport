
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../config/constants/app_colors.dart';
import '../../config/constants/app_fonts.dart';
import 'my_text_widget.dart';

class MyTextField extends StatefulWidget {
  String? label, hint;
  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  bool? isObSecure, haveLabel, isReadOnly;
  double? marginBottom, radius;
  int? maxLines;
  double? labelSize, hintsize;
  FocusNode? focusNode;
  Color? filledColor, focusedFillColor, hintColor, labelColor;
  Widget? prefix, suffix;
  FontWeight? labelWeight, hintWeight;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final double? height;
  final double? Width;

  MyTextField({
    Key? key,
    this.controller,
    this.hint,
    this.label,
    this.onChanged,
    this.isObSecure = false,
    this.marginBottom = 16.0,
    this.maxLines = 1,
    this.filledColor,
    this.focusedFillColor,
    this.hintColor,
    this.labelColor,
    this.haveLabel = true,
    this.labelSize,
    this.hintsize,
    this.prefix,
    this.suffix,
    this.labelWeight,
    this.hintWeight,
    this.keyboardType,
    this.isReadOnly,
    this.onTap,
    this.focusNode,
    this.radius,
    this.height = 48,
    this.Width,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = widget.focusNode?.hasFocus ?? false;
    });
  }

  @override
  void dispose() {
    widget.focusNode?.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          duration: Duration(milliseconds: 500),
        ),
        MoveEffect(
            curve: Curves.ease,
            duration: Duration(milliseconds: 500),
            transformHitTests: F)
      ],
      child: Padding(
        padding: EdgeInsets.only(bottom: widget.marginBottom ?? 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null)
              MyText(
                text: widget.label ?? '',
                size: widget.labelSize ?? 12,
                paddingBottom: 5,
                color: kBlack2Color,
                fontFamily: AppFonts.poppins,
                weight: widget.labelWeight ?? FontWeight.w600,
              ),
            Container(
              //height: widget.height,
              //width: widget.Width ?? double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.radius ?? 10),
                color: Colors.white,
              ),
              child: TextFormField(
                focusNode: widget.focusNode,
                onTap: widget.onTap,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: widget.keyboardType,
                cursorColor: kPrimaryColor,
                maxLines: widget.maxLines,
                readOnly: widget.isReadOnly ?? false,
                controller: widget.controller,
                onChanged: widget.onChanged,
                textInputAction: TextInputAction.next,
                obscureText: widget.isObSecure ?? false,
                obscuringCharacter: '*',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.poppins,
                  decoration: TextDecoration.none,
                  color: kPrimaryColor,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kCBGColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:kPrimaryColor,
                        width: 1
                    ),
                    borderRadius: BorderRadius.circular(widget.radius ?? 10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 10),
                    borderSide: BorderSide(
                      color: kWhiteLightColor,
                      width: 1,
                    ),
                  ),
                  prefixIcon: widget.prefix,
                  //prefixIconConstraints: BoxConstraints.tightFor(),
                  //suffixIconConstraints: BoxConstraints.tightFor(),
                  suffixIcon: widget.suffix,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: widget.maxLines! > 1 ? 15 : 0,
                  ),
                  // labelText: widget.label ?? '',
                  labelStyle: TextStyle(
                    color: kGreyTxColor,
                    fontSize: widget.labelSize ?? 12,
                    fontFamily: AppFonts.poppins,
                    fontWeight: widget.labelWeight ?? FontWeight.w600,
                  ),
                  hintText: widget.hint != null ? widget.hint!.tr : '',
                  hintStyle: TextStyle(
                    fontSize: widget.hintsize ?? 17,
                    fontFamily: AppFonts.poppins,
                    color: widget.hintColor ?? kGreyTxColor,
                    fontWeight: widget.hintWeight ?? FontWeight.w400,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 10),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 10),
                    borderSide: BorderSide(
                      width: 1,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





class MyTextField2 extends StatefulWidget {
  String? label, hint;
  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  bool? isObSecure, haveLabel, isReadOnly;
  double? marginBottom, radius;
  int? maxLines;
  double? labelSize, hintsize;
  FocusNode? focusNode;
  Color? filledColor, focusedFillColor, hintColor, labelColor;
  Widget? prefix, suffix;
  FontWeight? labelWeight, hintWeight;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final double? height;
  final double? Width;

  MyTextField2({
    Key? key,
    this.controller,
    this.hint,
    this.label,
    this.onChanged,
    this.isObSecure = false,
    this.marginBottom = 16.0,
    this.maxLines = 1,
    this.filledColor,
    this.focusedFillColor,
    this.hintColor,
    this.labelColor,
    this.haveLabel = true,
    this.labelSize,
    this.hintsize,
    this.prefix,
    this.suffix,
    this.labelWeight,
    this.hintWeight,
    this.keyboardType,
    this.isReadOnly,
    this.onTap,
    this.focusNode,
    this.radius,
    this.height = 48,
    this.Width,
  }) : super(key: key);

  @override
  State<MyTextField2> createState() => _MyTextField2State();
}

class _MyTextField2State extends State<MyTextField2> {
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = widget.focusNode?.hasFocus ?? false;
    });
  }

  @override
  void dispose() {
    widget.focusNode?.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          duration: Duration(milliseconds: 500),
        ),
        MoveEffect(
          curve: Curves.ease,
          duration: Duration(milliseconds: 500),
        ),
      ],
      child: Padding(
        padding: EdgeInsets.only(bottom: widget.marginBottom ?? 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.radius ?? 10),
                color: Colors.white,
              ),
              child: TextFormField(
                focusNode: widget.focusNode,
                onTap: widget.onTap,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: widget.keyboardType,
                cursorColor: kPrimaryColor,
                maxLines: widget.maxLines,
                readOnly: widget.isReadOnly ?? false,
                controller: widget.controller,
                onChanged: widget.onChanged,
                textInputAction: TextInputAction.next,
                obscureText: widget.isObSecure ?? false,
                obscuringCharacter: '*',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.poppins,
                  decoration: TextDecoration.none,
                  color: kPrimaryColor,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kCBGColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(widget.radius ?? 10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 10),
                    borderSide: BorderSide(
                      color: kWhiteLightColor,
                      width: 1,
                    ),
                  ),
                  prefixIcon: widget.prefix,
                  suffixIcon: widget.suffix,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: widget.maxLines! > 1 ? 15 : 0,
                  ),
                  labelText: widget.label ?? '',
                  labelStyle: TextStyle(
                    color: kGreyTxColor,
                    fontSize: widget.labelSize ?? 12,
                    fontFamily: AppFonts.poppins,
                    fontWeight: widget.labelWeight ?? FontWeight.w600,
                  ),
                  hintText: widget.hint != null ? widget.hint!.tr : '',
                  hintStyle: TextStyle(
                    fontSize: widget.hintsize ?? 17,
                    fontFamily: AppFonts.poppins,
                    color: widget.hintColor ?? kGreyTxColor,
                    fontWeight: widget.hintWeight ?? FontWeight.w400,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 10),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 10),
                    borderSide: BorderSide(
                      width: 1,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
