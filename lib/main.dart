import 'package:do_code/pages/home_page.dart';
import 'package:do_code/pages/progress_page.dart';
import 'package:do_code/pages/user_page.dart';
import 'package:do_code/widgets/custom_arcade_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/adapters.dart';

import 'ProgressLogic/hive_service.dart';
import 'ProgressLogic/progress_cubit.dart';
import 'navigation_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  await Hive.openBox('progress');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavigationCubit()),
          BlocProvider(create: (context) => LevelsNavigationCubit()),
          BlocProvider(
            create: (context) {
              final box = Hive.box('progress');
              return ProgressCubit(HiveService(box));
            },
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                fontFamily: 'VAG'
            ),
            home: HubPage()
        )
    );
  }
}

class HubPage extends StatelessWidget {
  const HubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationCubit, AppPage>(
        builder: (context, page) {
          switch (page) {
            case AppPage.levels:
              return HomePage();
            case AppPage.achievements:
              return ProgressPage();
            case AppPage.user:
              return UserPage();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, AppPage>(
        builder: (context, page) {
          return CustomArcadeBottomBar(
            currentPage: page,
            onTap: (newPage) {
              context.read<NavigationCubit>().setPage(newPage);
            },
          );
        },
      ),
    );
  }
}

