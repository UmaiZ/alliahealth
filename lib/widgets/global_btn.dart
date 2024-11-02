import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SolidButton extends StatelessWidget {
  final String text;
  final double wd;
  final double ht;
  final VoidCallback tap;
  const SolidButton(
      {super.key,
      required this.text,
      required this.wd,
      required this.tap,
      required this.ht});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: wd,
      height: ht,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            minimumSize: const Size(88, 36),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
            )),
        onPressed: tap,
        child: Text(text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
