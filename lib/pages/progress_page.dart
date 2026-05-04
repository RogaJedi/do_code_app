import 'package:flutter/material.dart';

import '../widgets/custom_arcade_button.dart';

class ProgressPage extends StatelessWidget {

  const ProgressPage({
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
                Text("Мой прогресс", style: TextStyle(fontSize: 50), textAlign: TextAlign.center,),
                SizedBox(height: 20,),
                CustomArcadeButton(
                    onTap: () {},
                    mainColor: Color(0xFF444444),
                    shadowColor: Color(0xFF222222),
                    width: 400,
                    height: 100,
                    text: "Первые шаги",
                    textColor: Colors.white,
                    fontSize: 30
                ),
                SizedBox(height: 20,),
                CustomArcadeButton(
                    onTap: () {},
                    mainColor: Color(0xFF444444),
                    shadowColor: Color(0xFF222222),
                    width: 400,
                    height: 100,
                    text: "Знаток переменных",
                    textColor: Colors.white,
                    fontSize: 30
                ),
                SizedBox(height: 20,),
                CustomArcadeButton(
                    onTap: () {},
                    mainColor: Color(0xFF444444),
                    shadowColor: Color(0xFF222222),
                    width: 400,
                    height: 100,
                    text: "Знаток массивов",
                    textColor: Colors.white,
                    fontSize: 30
                ),
                SizedBox(height: 20,),
                CustomArcadeButton(
                    onTap: () {},
                    mainColor: Color(0xFF444444),
                    shadowColor: Color(0xFF222222),
                    width: 400,
                    height: 100,
                    text: "Серьёзные намерения",
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