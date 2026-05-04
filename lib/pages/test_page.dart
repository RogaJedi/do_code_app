import 'package:do_code/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {

  const TestPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("TEST_PAGE", style: TextStyle(fontSize: 60),),
            CustomButton(
                onTap: () {},
                mainColor: Colors.green,
                width: 200,
                height: 100,
                text: "=",
                textColor: Colors.white,
                fontSize: 50,
                hasIcon: false)
          ],
        )
      ),
    );
  }
}