import 'package:alliahealth/model/question.dart';
import 'package:alliahealth/services/navigationservice.dart';
import 'package:alliahealth/view/home_3.dart';
import 'package:alliahealth/viewmodel/feelings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeSecond extends StatelessWidget {
  final Question question;
  HomeSecond({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ExcitementViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          children: [
            120.verticalSpace,
            Text(
              question.question,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8),
            Text(
              "Select the number that best represents your Excitement level.",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .merge(TextStyle(color: Color(0xff474747))),
            ),
            SizedBox(height: 32),
            CarouselSlider(
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  viewModel.activeFeelingCarousel = index;
                },
                height: 291.0,
                enlargeCenterPage: true,
                viewportFraction: 0.7,
              ),
              items: question.options.asMap().entries.map((entry) {
                int index = entry.key;
                var option = entry.value;
                var image = viewModel.optionsDetails
                    .firstWhere((d) => d['option'] == option.option);

                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: 266.w,
                      child: Card(
                        color: Colors.white,
                        elevation: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              image['image'].toString(),
                              height: 100.h,
                            ),
                            10.verticalSpace,
                            Text(
                              option.option,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .merge(TextStyle(color: Color(0xffAC8E63))),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
