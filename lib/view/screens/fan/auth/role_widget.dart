import 'package:flutter/material.dart';
import 'package:passion_port/view/custom/my_text_widget.dart';
import '../../../../config/constants/app_colors.dart';

class RadioOption extends StatelessWidget {
  final dynamic value;
  final dynamic groupValue;
  final Function(dynamic)? onChanged;
  final String title;
  final String subtitle;

  const RadioOption({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(value); // ✅ Change value on tap
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
        decoration: ShapeDecoration(
          color: isSelected ? kPrimaryLightColor : kCBGColor, // ✅ Change bg color
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: isSelected ? kPrimaryColor : kWhiteLightColor, // ✅ Change border color
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          children: [
            RadioTheme(
              data: RadioThemeData(
                fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                  if (states.contains(MaterialState.selected)) {
                    return kPrimaryColor; // ✅ Selected color
                  }
                  return kGreyTxColor; // ✅ Unselected color
                }),
              ),
              child: Radio(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ),


            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: title,
                    size: 17,
                    weight: FontWeight.w600,
                    color: isSelected ? kPrimaryColor : kGreyTxColor,
                  ),
                  const SizedBox(height: 5),
                  MyText(
                    text: subtitle,
                    size: 12,
                    weight: FontWeight.w400,
                    color: isSelected ? kPrimaryColor : kGreyTxColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
