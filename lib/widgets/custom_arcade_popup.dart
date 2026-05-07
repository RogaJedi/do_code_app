import 'package:flutter/material.dart';


void showGameDialog({
  required BuildContext context,
  required Widget child,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Dialog",
    barrierColor: Colors.black.withValues(alpha: 0.6),
    transitionDuration: const Duration(milliseconds: 250),

    pageBuilder: (_, __, ___) => const SizedBox(),

    transitionBuilder: (context, animation, _, __) {
      final curved = Curves.easeOutBack.transform(animation.value);

      return Transform.scale(
        scale: curved,
        child: Opacity(
          opacity: animation.value,
          child: Center(child: child),
        ),
      );
    },
  );
}

class CustomArcadePopup extends StatelessWidget {
  final String content;
  final List<Widget> actions;

  const CustomArcadePopup({
    super.key,
    required this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
          width: 350,
          height: 500,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFf3f6f4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [


              Center(
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: content.length <= 90
                        ? 30
                        : 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'VAG',
                  ),
                ),
              ),


              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: actions,
                ),
              )
            ],
          )
      ),
    );
  }
}