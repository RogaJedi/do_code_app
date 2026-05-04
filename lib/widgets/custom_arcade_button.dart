import 'package:flutter/material.dart';

class CustomArcadeButton extends StatefulWidget {
  final Function() onTap;
  final Color mainColor;
  final Color shadowColor;
  final double width;
  final double height;
  final String? text;
  final Color? textColor;
  final double? fontSize;
  final double? gap;
  final Widget? icon;

  const CustomArcadeButton({
    super.key,
    required this.onTap,
    required this.mainColor,
    required this.shadowColor,
    required this.width,
    required this.height,
    this.text,
    this.textColor,
    this.fontSize,
    this.gap,
    this.icon,
  });

  @override
  State<CustomArcadeButton> createState() => _CustomArcadeButtonState();
}

class _CustomArcadeButtonState extends State<CustomArcadeButton> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    widget.onTap();
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    const double depth =10;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: SizedBox(
        width: widget.width,
        height: widget.height + depth,
        child: Stack(
          children: [
            //shadow
            Positioned(
              top: depth,
              child: Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  color: widget.shadowColor,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            //button
            AnimatedPositioned(
              duration: const Duration(milliseconds: 60),
              curve: Curves.easeOut,
              top: _isPressed ? depth : 0,
              child: Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  color: widget.mainColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      if (widget.text != null) ...[
                        Text(
                          widget.text!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: widget.textColor,
                            fontSize: widget.fontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],

                      if (widget.gap != null) ...[
                        SizedBox(width: widget.gap,)
                      ],

                      if (widget.icon != null) ...[
                        widget.icon!,
                      ],

                    ],
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