import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showtoast(message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xff2E959E),
      textColor: Colors.white,
      fontSize: 16.0);
}
