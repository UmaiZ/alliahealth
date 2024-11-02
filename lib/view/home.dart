import 'package:alliahealth/model/question.dart';
import 'package:alliahealth/view/home_1.dart';
import 'package:alliahealth/view/home_2.dart';
import 'package:alliahealth/view/home_3.dart';
import 'package:alliahealth/viewmodel/feelings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F7F3),
      body: Consumer<ExcitementViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: viewModel.pageController,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (int page) {
                    viewModel.setPage(page);
                  },
                  itemCount: viewModel.questionList.length,
                  itemBuilder: (context, index) {
                    final question = viewModel.questionList[index];

                    if (question.answerType == "single_choice" &&
                        question.options
                                .where((d) => d.isFreeForm)
                                .toList()
                                .length >
                            0) {
                      return HomeThree(question: question);
                    } else if (question.answerType == "single_choice") {
                      return HomeSecond(question: question);
                    } else if (question.answerType == "likert_scale") {
                      return HomeFirst(question: question);
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.changePage();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10.w),
                ),
                child: Icon(Icons.arrow_forward, size: 33.w),
              ),
              100.verticalSpace,
            ],
          );
        },
      ),
    );
  }
}
