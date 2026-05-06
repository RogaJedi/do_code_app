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
  final String? title;
  final Widget content;
  final List<Widget> actions;

  const CustomArcadePopup({
    super.key,
    this.title,
    required this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF2c2c2c),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          title == null
          ? SizedBox()
          : Text(
            title!,
            style: const TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: title == null ? 0 : 20),


          content,


          const SizedBox(height: 20),

          Column(
            children: actions
                .map((a) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: a,
            ))
                .toList(),
          )
        ],
      ),
    );
  }
}