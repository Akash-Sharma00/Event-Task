import 'package:first_app/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final bool loading;
  final double width;
  final String title;
  const MyElevatedButton(
      {super.key,
      required this.onPressed,
      this.width = 160,
      required this.title,
      required this.loading});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Pallate.ff052850,
          minimumSize: Size(width.w, 40.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))),
      child: loading
          ? SizedBox(
              height: 20,
              width: 20,
              child: Center(
                  child: CircularProgressIndicator(
                color: Pallate.white,
                strokeWidth: 1,
              )),
            )
          : Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 12.sp),
            ),
    );
  }
}
