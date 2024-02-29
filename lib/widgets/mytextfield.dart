import 'package:first_app/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int? maxLines;
  final bool enabled;
  final TextInputAction textInputAction;
  final Function()? onTap;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.label,
      this.textInputAction = TextInputAction.next,
      this.enabled = true,
      this.maxLines,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Pallate.ff848A94, fontSize: 15.sp),
        ),
        SizedBox(
          height: 15.h,
        ),
        TextField(
          // onTapOutside: (event) => FocusManager(),
          onTap: onTap,
          controller: controller,
          maxLines: maxLines,
          textInputAction: textInputAction,
          enabled: enabled,
          style: TextStyle(
              fontSize: 19.sp,
              color: Pallate.ff052850,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18.r),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              fillColor: Pallate.white,
              filled: true),
        ),
      ],
    );
  }
}
