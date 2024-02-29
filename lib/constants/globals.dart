import 'package:first_app/constants/constant.dart';
import 'package:first_app/controllers/details_controller.dart';
import 'package:first_app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void initAllController() {
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => DetailsController());
}

List<Widget> getAppBarAction() {
  return [
    Image.asset(
      AssetConst.searchIc,
      width: 27.w,
      height: 27.w,
    ),
    SizedBox(
      width: 13.w,
    ),
    SizedBox(
      height: 21.h,
      child: const VerticalDivider(),
    ),
    SizedBox(
      width: 13.w,
    ),
    Image.asset(
      AssetConst.burger,
      width: 27.w,
      height: 27.w,
    ),
    SizedBox(
      width: 13.w,
    ),
  ];
}
