import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationService {
  // Initialize the navigation key directly
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  static final NavigationService instance = NavigationService._internal();

  NavigationService._internal();

  Future<dynamic> navigate(Widget route) {
    return navigationKey.currentState!.push(
      MaterialPageRoute(builder: (context) => route),
    );
  }

  navigatewithoutback(Widget rn) {
    return navigationKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => rn,
        ),
        (Route<dynamic> route) => false);
  }

  goBack() {
    return navigationKey.currentState!.pop();
  }

  showLoader() {
    Future.delayed(Duration.zero, () {
      showDialog(
          context: navigationKey.currentContext!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const SizedBox(
              height: 25.0,
              width: 25.0,
              child: Center(child: CircularProgressIndicator()),
            );
          });
    });
  }
}
