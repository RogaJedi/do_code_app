import 'package:flutter/material.dart';

import '../widgets/custom_arcade_button.dart';

class UserPage extends StatelessWidget {

  const UserPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Личный кабинет", style: TextStyle(fontSize: 50), textAlign: TextAlign.center,),
                SizedBox(height: 80,),
                CustomArcadeButton(
                    onTap: () {},
                    mainColor: Color(0xFF2d9400),
                    shadowColor: Color(0xFF1b5800),
                    width: 400,
                    height: 100,
                    text: "Регистрация",
                    textColor: Colors.white,
                    fontSize: 30
                ),
              ],
            ),
          )
      ),
    );
  }
}