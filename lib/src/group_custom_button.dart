import 'package:flutter/material.dart';

class GroupCustomButton extends StatelessWidget {
  const GroupCustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.isSelected,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.selectedColor,
    this.unselectedColor,
    required this.selectedBorderColor,
    required this.unselectedBorderColor,
    this.borderRadius,
    this.selectedShadow,
    this.unselectedShadow,
    this.height,
    this.width,
    this.alignment,
    this.margin,
  }) : super(key: key);

  final String text;
  final void Function() onPressed;
  final bool isSelected;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color selectedBorderColor;
  final Color unselectedBorderColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? selectedShadow;
  final List<BoxShadow>? unselectedShadow;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 50),
      // height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(30),
        boxShadow: isSelected ? selectedShadow : unselectedShadow,
      ),
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: isSelected
                ? MaterialStateProperty.all<Color?>(selectedColor)
                : MaterialStateProperty.all<Color?>(unselectedColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(30),
                side: BorderSide(
                  color:
                      isSelected ? selectedBorderColor : unselectedBorderColor,
                ),
              ),
            ),
            padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
            alignment: alignment),
        child: Text(
          text,
          style: isSelected ? selectedTextStyle : unselectedTextStyle,
        ),
      ),
    );
  }
}
