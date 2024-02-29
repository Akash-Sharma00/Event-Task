import 'package:first_app/constants/constant.dart';
import 'package:first_app/constants/globals.dart';
import 'package:first_app/controllers/home_controller.dart';
import 'package:first_app/widgets/myelevated_button.dart';
import 'package:first_app/widgets/mytextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  late HomeController controller;
  @override
  void initState() {
    controller = Get.find<HomeController>();
    controller.eventNameController.clear();
    controller.date.clear();
    controller.endTime.clear();
    controller.startTime.clear();
    controller.about.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              MyTextField(
                  controller: controller.eventNameController,
                  label: "Task name"),
              SizedBox(
                height: 30.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Photos",
                  style: TextStyle(color: Pallate.ff848A94, fontSize: 15.sp),
                ),
              ),
              SizedBox(
                height: 17.h,
              ),
              Obx(
                () => Row(
                  children: [
                    for (int i = 0; i < controller.eventImages.length; i++)
                      Padding(
                        padding: EdgeInsets.only(right: 17.w),
                        child: GestureDetector(
                          onTap: () {
                            controller.selectedIndex.value = i;
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: 44.w,
                                height: 44.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: FileImage(controller.eventImages[i]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              if (i == controller.selectedIndex.value)
                                Container(
                                  width: 44.w,
                                  height: 44.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Pallate.ff3580FF.withOpacity(0.63),
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: Pallate.white,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    GestureDetector(
                      onTap: () =>
                          controller.pickPicture(ImageSource.gallery, context),
                      child: Container(
                        width: 44.w,
                        height: 44.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Pallate.white,
                            border:
                                Border.all(color: Pallate.ff756EF3, width: 1)),
                        child: Icon(
                          Icons.add,
                          color: Pallate.ff756EF3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () => controller.dateSet(context),
                child: MyTextField(
                  controller: controller.date,
                  label: "Date",
                  enabled: false,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 160.w,
                    child: GestureDetector(
                      onTap: () => controller.timeSet(1, context),
                      child: MyTextField(
                          enabled: false,
                          controller: controller.startTime,
                          label: "Start Time"),
                    ),
                  ),
                  SizedBox(
                    width: 160.w,
                    child: GestureDetector(
                      onTap: () => controller.timeSet(2, context),
                      child: MyTextField(
                          enabled: false,
                          controller: controller.endTime,
                          label: "End Time"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              MyTextField(
                  controller: controller.about,
                  maxLines: 3,
                  label: "About Event"),
              SizedBox(
                height: 16.h,
              ),
              Obx(
                () => MyElevatedButton(
                    onPressed: () => controller.saveEvent(),
                    title: "Create Event",
                    loading: controller.isLoading.value),
              )
            ],
          ),
        ),
      ),
    );
  }
}
