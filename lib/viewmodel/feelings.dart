import 'package:alliahealth/model/question.dart';
import 'package:alliahealth/services/navigationservice.dart';
import 'package:alliahealth/services/network.dart';
import 'package:alliahealth/services/toast.dart';
import 'package:alliahealth/view/home.dart';
import 'package:alliahealth/view/home_1.dart';
import 'package:alliahealth/view/onboarding.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class ExcitementViewModel extends ChangeNotifier {
  final NavigationService _navigationService;
  TextEditingController answerController = TextEditingController();
  int activeFeelingCarousel = 0;
  List<Question> questionList = [];

  double excitementLevel = 4.0;
  ui.Image? thumbImage;
  int _currentPage = 0;
  int get currentPage => _currentPage;
  final PageController pageController = PageController();

  List answerResponse = [];

  var optionsDetails = [
    {"option": "Happy", "image": "assets/emojis_icons/4.png"},
    {"option": "Frustrated", "image": "assets/emojis_icons/1.png"},
    {"option": "Sad", "image": "assets/emojis_icons/3.png"},
    {"option": "Angry", "image": "assets/emojis_icons/2.png"},
    {"option": "Peaceful", "image": "assets/emojis_icons/6.png"},
    {"option": "Excited", "image": "assets/emojis_icons/5.png"}
  ];

  ExcitementViewModel(this._navigationService) {
    _loadImage();
  }

  Future<void> _loadImage() async {
    final ByteData data = await rootBundle
        .load('assets/emojis_icons/${excitementLevel.toInt()}.png');
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    thumbImage = frame.image;
    notifyListeners();
  }

  void setExcitementLevel(double value) {
    excitementLevel = value;
    _loadImage();
    notifyListeners();
  }

  getQuestions() async {
    _navigationService.showLoader();
    var response = await NetworkHelper().getApi(
      ApiUrls().getQuestions,
    );
    if (response != null && response['success']) {
      _navigationService.goBack();
      questionList = (response['body'] as List)
          .map((q) => Question.fromJson(q as Map<String, dynamic>))
          .toList();
      _navigationService.navigate(HomeScreen());
    } else {
      _navigationService.goBack();
    }

    notifyListeners();
  }

  void setPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  changePage() async {
    answerResponse.add({
      "questionId": questionList[currentPage].id,
      "selectedOptionId": _getSelectedOptionId(),
      "freeformValue": null
    });
    if (currentPage == questionList.length - 1) {
      _navigationService.showLoader();

      var response = await NetworkHelper()
          .postApi(ApiUrls().postQuestion, {"answers": answerResponse});
      print(response);
      if (response != null && response['success']) {
        showtoast(response['body']);
        _navigationService.goBack();
        _navigationService.navigate(const Onboarding());
      } else {
        _navigationService.goBack();
      }
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setPage(currentPage + 1);
      print(answerResponse);
    }
  }

  _getSelectedOptionId() {
    final currentQuestion = questionList[currentPage];

    if (currentQuestion.answerType == "single_choice") {
      if (currentQuestion.options.any((d) => d.isFreeForm)) {
        return 509;
      } else {
        return questionList[currentPage].options[activeFeelingCarousel].id;
      }
    } else if (currentQuestion.answerType == "likert_scale") {
      return questionList[currentPage]
          .options
          .firstWhere((d) => d.option == "${excitementLevel.toInt()}")
          .id;
    }
    return 0;
  }
}
