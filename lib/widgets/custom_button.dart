import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final Color mainColor;
  final double width;
  final double height;
  final String text;
  final Color textColor;
  final double fontSize;
  final bool hasIcon;
  final Icon? icon;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.mainColor,
    required this.width,
    required this.height,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.hasIcon,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      splashColor: Colors.grey.withValues(alpha: 0.1),
      highlightColor: Colors.grey.withValues(alpha: 0.1),
      child: Ink(
        decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(60),
            boxShadow: [
              BoxShadow(
                color: mainColor.withValues(alpha: 0.9),
                spreadRadius: 0,
                blurRadius: 0,
                offset: Offset(0, 15),
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 0),
              )
            ]
        ),
        width: width,
        height: height,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hasIcon
                  ? icon!
                  : SizedBox.shrink(),
              Text(
                text,
                style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w300
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}