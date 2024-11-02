import 'package:alliahealth/services/navigationservice.dart';
import 'package:alliahealth/view/home_1.dart';
import 'package:alliahealth/view/home_2.dart';
import 'package:alliahealth/view/onboarding.dart';
import 'package:alliahealth/viewmodel/feelings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ExcitementViewModel>(
            create: (context) =>
                ExcitementViewModel(NavigationService.instance)),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 800),
          minTextAdapt: false,
          builder: (context, child) {
            return MaterialApp(
              navigatorKey: NavigationService.instance.navigationKey,
              title: 'Flutter Demo',
              theme: ThemeData(
                  useMaterial3: true,
                  fontFamily: "DmSans",
                  colorScheme: ColorScheme.fromSeed(
                    primary: Color(0xff2E959E),
                    seedColor: Color(0xff2E959E),
                  ),
                  textTheme: TextTheme(
                    headlineMedium: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "SourceSerif",
                    ),
                    headlineLarge: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "SourceSerif",
                    ),
                    bodyMedium: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "SourceSerif",
                    ),
                    bodyLarge: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "SourceSerif",
                    ),
                  )),
              home: Onboarding(),
            );
          }),
    );
  }
}
