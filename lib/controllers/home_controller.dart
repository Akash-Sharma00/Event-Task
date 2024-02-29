import 'dart:io';

import 'package:first_app/event_model.dart';
import 'package:first_app/utils/connect_to_fire.dart';
import 'package:first_app/views/event_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  RxList<EventModel> list = <EventModel>[].obs;
  TextEditingController eventNameController = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController startTime = TextEditingController();
  TextEditingController endTime = TextEditingController();
  TextEditingController about = TextEditingController();
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxList<File> eventImages = <File>[].obs;
  ConnectToFire connectToFire = ConnectToFire();

  Future pickPicture(ImageSource source, BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imagePath = File(image.path);
      eventImages.value = [...eventImages, imagePath];
      selectedIndex.value = 0;
    } on PlatformException {
      Fluttertoast.showToast(msg: "Something went Wrong");
    }
  }

  @override
  void onInit() {
    getEvets();
    super.onInit();
  }

  void saveEvent() async {
    if (eventNameController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Enter name of task");
      return;
    }
    if (date.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Enter date");
      return;
    }
    if (startTime.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Enter Start time");
      return;
    }
    if (endTime.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Enter end time");
      return;
    }
    if (about.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Enter end time");
      return;
    }
    isLoading.value = true;
    String? url;
    if (eventImages.isNotEmpty) {
      url =
          await connectToFire.uploadPicEvent(eventImages[selectedIndex.value]);
    }
    await connectToFire.saveEvent(
        url,
        eventNameController.text.trim(),
        date.text.trim(),
        startTime.text.trim(),
        endTime.text.trim(),
        about.text.trim());
    getEvets();

    Get.off(() => EventView(
        title: eventNameController.text,
        date: date.text,
        startTime: startTime.text,
        endTime: endTime.text,
        about: about.text));


    isLoading.value = false;
  }

  void timeSet(int type, BuildContext context) async {
    TimeOfDay? date =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (date == null) {
      return;
    }
    if (type == 1) {
      startTime.text = DateFormat.jm().format(DateTime(
        1,
        1,
        1,
        date.hour,
        date.minute,
      ));
    } else {
      endTime.text = DateFormat.jm().format(DateTime(
        1,
        1,
        1,
        date.hour,
        date.minute,
      ));
    }
  }

  void dateSet(BuildContext context) async {
    DateTime? eventDate = await showDatePicker(
        context: context, firstDate: DateTime.now(), lastDate: DateTime(2025));
    if (eventDate == null) {
      return;
    }

    date.text = DateFormat.yMMMMd().format(eventDate);
  }

  getEvets() async {
    list.value = await connectToFire.getEvetnts();
  }
}
