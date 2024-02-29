import 'package:first_app/constants/constant.dart';
import 'package:first_app/event_model.dart';
import 'package:first_app/views/event_view.dart';
import 'package:first_app/widgets/myelevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_stack/image_stack.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String image;
  final String month;
  final EventModel model;
  const EventCard(
      {super.key,
      required this.title,
      required this.date,
      required this.image,
      required this.month,
      required this.model});

  @override
  Widget build(BuildContext context) {
    List<String> imagex = [
      AssetConst.person1,
      AssetConst.person2,
      AssetConst.person3,
    ];
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.h),
          margin: EdgeInsets.only(right: 20.w),
          decoration: BoxDecoration(
              color: Pallate.white, borderRadius: BorderRadius.circular(15.r)),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.asset(
                  image,
                  height: 112.h,
                  width: 186.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10.w,
              ),
              SizedBox(
                width: 150.w,
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Pallate.black),
                ),
              ),
              SizedBox(
                height: 5.w,
              ),
              Row(
                children: [
                  ImageStack(
                    imageList: imagex,
                    totalCount: imagex.length,
                    imageSource: ImageSource.Asset,
                    imageBorderColor: Colors.grey,
                    imageBorderWidth: 1,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "+20 Going",
                    style:
                        TextStyle(color: Pallate.ff3F38DD, fontSize: 11.5.sp),
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Image.asset(
                    AssetConst.location,
                    width: 13.w,
                    height: 13.w,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "36 Guild Street London, UK",
                    style:
                        TextStyle(color: Pallate.ff848A94, fontSize: 11.5.sp),
                  )
                ],
              ),
              SizedBox(
                height: 13.w,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: MyElevatedButton(
                    onPressed: () {
                      Get.to(() => EventView(
                          title: title,
                          date: model.date,
                          startTime: model.startTime,
                          endTime: model.endTime,
                          about: model.des));
                    },
                    title: "View More",
                    loading: false),
              )
            ],
          ),
        ),
        Positioned(
            top: 15.h,
            left: 15.w,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
              width: 38.5.w,
              // height: 40.h,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(9.r),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    date,
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  Text(
                    month,
                    style: TextStyle(fontSize: 11.sp),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
