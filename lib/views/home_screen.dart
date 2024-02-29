import 'package:first_app/constants/constant.dart';
import 'package:first_app/constants/globals.dart';
import 'package:first_app/controllers/home_controller.dart';
import 'package:first_app/event_model.dart';
import 'package:first_app/views/create_event_view.dart';
import 'package:first_app/widgets/eventcard.dart';
import 'package:first_app/widgets/myelevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: Pallate.eaf2fa,
      appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                AssetConst.defaultDp,
                width: 48.w,
                height: 48.w,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 13.w,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: "Hello,\n",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey[600],
                  ),
                ),
                TextSpan(
                    text: "Akash",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    )),
              ]))
            ],
          ),
          actions: getAppBarAction()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 22.h,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Events",
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Pallate.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 11.h,
            ),
            SizedBox(
              height: 300.h,
              child: Obx(
                () => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    EventModel data = controller.list[index];
                    List<String> date = data.date.split(" ");
                    return EventCard(
                      title: data.title,
                      date: date[1].substring(0, 2).replaceAll(",", ""),
                      month: date[0].substring(0, 3),
                      image: AssetConst.event,
                      model: data,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            MyElevatedButton(
                onPressed: () {
                  Get.to(() => const CreateEvent());
                },
                title: "Create event",
                loading: false)
          ],
        ),
      ),
    );
  }
}
