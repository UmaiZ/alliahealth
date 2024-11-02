import 'package:alliahealth/model/question.dart';
import 'package:alliahealth/view/home_2.dart';
import 'package:alliahealth/viewmodel/feelings.dart';
import 'package:alliahealth/widgets/customthumb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeFirst extends StatelessWidget {
  final Question question;
  const HomeFirst({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExcitementViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          children: [
            120.verticalSpace,
            Text(
              question.question,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              "Excited",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .merge(const TextStyle(color: Color(0xffAC8E63))),
            ),
            const SizedBox(height: 8),
            Text(
              "Select the number that best represents your Excitement level.",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .merge(const TextStyle(color: Color(0xff474747))),
            ),
            const SizedBox(height: 32),
            SizedBox(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(5, (index) {
                          int reversedIndex = 4 - index;
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 4,
                                    color: viewModel.excitementLevel.toInt() >=
                                            (reversedIndex + 1)
                                        ? Theme.of(context).primaryColor
                                        : const Color(0xffF1EDE3),
                                  ),
                                  SizedBox(width: 30.w),
                                  Container(
                                    width: 30,
                                    height: 4,
                                    color: viewModel.excitementLevel.toInt() >=
                                            (reversedIndex + 1)
                                        ? Theme.of(context).primaryColor
                                        : const Color(0xffF1EDE3),
                                  ),
                                ],
                              ),
                              reversedIndex != 0
                                  ? 38.verticalSpace
                                  : 0.verticalSpace
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6 * 50.h,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 22.w,
                          thumbShape: CustomThumbShape(viewModel.thumbImage),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 30.0),
                          activeTrackColor: Theme.of(context).primaryColor,
                          activeTickMarkColor: Colors.transparent,
                          inactiveTickMarkColor: Colors.transparent,
                          inactiveTrackColor: const Color(0xffF1EDE3),
                        ),
                        child: Slider(
                          value: viewModel.excitementLevel,
                          min: 1,
                          max: 6,
                          divisions: 6,
                          onChanged: (value) {
                            viewModel.setExcitementLevel(value);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
