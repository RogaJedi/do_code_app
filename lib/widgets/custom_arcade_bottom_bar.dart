import 'package:flutter/material.dart';

import '../navigation_cubit.dart';
import 'custom_arcade_button.dart';

class CustomArcadeBottomBar extends StatelessWidget {
  final AppPage currentPage;
  final Function(AppPage) onTap;

  const CustomArcadeBottomBar({
    super.key,
    required this.currentPage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 5,
            color: Color(0xFF202020),
            radius: BorderRadius.circular(10),
            indent: 15,
            endIndent: 15,
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _item(AppPage.levels, Icons.videogame_asset),
                _item(AppPage.achievements, Icons.emoji_events),
                _item(AppPage.user, Icons.person),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(AppPage page, IconData icon) {
    final bool isSelected = currentPage == page;

    return CustomArcadeButton(
      onTap: () => onTap(page),
      width: 70,
      height: 50,
      mainColor: isSelected ? Colors.orange : Colors.grey.shade700,
      shadowColor: isSelected ? Colors.deepOrange : Colors.grey.shade900,
      icon: Icon(icon, color: Colors.white, size: 30,),
    );
  }
}