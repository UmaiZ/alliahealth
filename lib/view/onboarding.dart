import 'package:alliahealth/services/navigationservice.dart';
import 'package:alliahealth/view/home_1.dart';
import 'package:alliahealth/viewmodel/feelings.dart';
import 'package:alliahealth/widgets/global_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/onboarding_assets/onboarding_welcome.png",
              height: 224.h,
            ),
            10.verticalSpace,
            Text(
              "Self report completed",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            20.verticalSpace,
            Consumer<ExcitementViewModel>(
              builder: (context, viewModel, child) => SolidButton(
                text: 'Go to Home',
                wd: 328.w,
                ht: 48.h,
                tap: () async {
                  await viewModel.getQuestions();
                },
              ),
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }
}
