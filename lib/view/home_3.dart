import 'package:alliahealth/model/question.dart';
import 'package:alliahealth/viewmodel/feelings.dart';
import 'package:alliahealth/widgets/customthumb.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeThree extends StatelessWidget {
  final Question question;
  HomeThree({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ExcitementViewModel>(
      builder: (context, viewModel, child) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 329.w,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hi David, How are you?",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              10.verticalSpace,
              Container(
                width: 329.w,
                decoration: BoxDecoration(
                    color: Color(0xffAC8E63),
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: TextField(
                          controller: viewModel.answerController,
                          minLines: 2,
                          maxLines: 2,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: question.question,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .merge(TextStyle(color: Color(0xffE1D9C5)))),
                        ),
                      ),
                      10.verticalSpace,
                      Text(
                        "Take a check-in",
                        style: Theme.of(context).textTheme.bodyMedium!.merge(
                            TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
