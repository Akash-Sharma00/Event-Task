import 'package:first_app/constants/constant.dart';
import 'package:first_app/constants/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_stack/image_stack.dart';

class EventView extends StatelessWidget {
  final String? image;
  final String title;
  final String date;
  final String startTime;
  final String endTime;
  final String about;
  const EventView(
      {super.key,
      this.image,
      required this.title,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.about});

  @override
  Widget build(BuildContext context) {
    List<String> imagex = [
      AssetConst.person1,
      AssetConst.person2,
      AssetConst.person3,
    ];
    return Scaffold(
      backgroundColor: Pallate.eaf2fa,
      appBar: AppBar(
        title: Text(
          "Add Event",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Pallate.black,
          ),
        ),
        actions: getAppBarAction(),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AssetConst.event,
                  fit: BoxFit.cover,
                  height: 260.h,
                  width: double.infinity,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Text(
                        title,
                        style: TextStyle(color: Pallate.black, fontSize: 35.sp),
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48.w,
                            width: 48.h,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Pallate.ff5669FF.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15.r)),
                            child: Image.asset(AssetConst.calenderIc),
                          ),
                          SizedBox(
                            width: 14.w,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  date,
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Pallate.black),
                                ),
                                Text(
                                  "Tuesday, $startTime-$endTime",
                                  style: TextStyle(
                                      fontSize: 11.sp, color: Colors.grey),
                                ),
                              ])
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48.w,
                            width: 48.h,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Pallate.ff5669FF.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15.r)),
                            child: Image.asset(AssetConst.blueLocationIc),
                          ),
                          SizedBox(
                            width: 14.w,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Gala Convention Center",
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Pallate.black),
                                ),
                                Text(
                                  "36 Guild London Uk",
                                  style: TextStyle(
                                      fontSize: 11.sp, color: Colors.grey),
                                ),
                              ])
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "About Event",
                        style: TextStyle(fontSize: 18.sp, color: Pallate.black),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        about,
                        style: TextStyle(fontSize: 16.sp, color: Pallate.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 230.h,
              left: 0,
              right: 0,
              child: Container(
                height: 60.h,
                width: 200.w,
                margin: EdgeInsets.symmetric(horizontal: 0.2.sw),
                decoration: BoxDecoration(
                    color: Pallate.white,
                    borderRadius: BorderRadius.circular(50.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageStack(
                      imageList: imagex,
                      totalCount: imagex.length,
                      imageSource: ImageSource.Asset,
                      imageBorderColor: Pallate.white,
                      imageBorderWidth: 2,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "+20 Going",
                      style: TextStyle(
                          color: Pallate.ff3F38DD,
                          fontSize: 15.5.sp,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
