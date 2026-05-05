import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ProgressLogic/progress_cubit.dart';
import '../ProgressLogic/progress_state.dart';
import '../widgets/custom_arcade_button.dart';

class UserPage extends StatelessWidget {

  const UserPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProgressCubit, ProgressState>(
          builder: (context, state) {
            return Center(
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
                      SizedBox(height: 30,),
                      CustomArcadeButton(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text("Reset progress?"),
                              content: const Text("This cannot be undone."),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.read<ProgressCubit>().resetProgress();
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Reset"),
                                ),
                              ],
                            ),
                          );
                        },
                        mainColor: const Color(0xFFb11818),
                        shadowColor: const Color(0xFF6a0e0e),
                        width: 220,
                        height: 80,
                        text: "RESET",
                        fontSize: 25,
                        textColor: Colors.white,
                      ),

                    ],
                  ),
                )
            );
          }
      )
    );
  }
}