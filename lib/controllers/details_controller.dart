import 'dart:io';

import 'package:first_app/utils/connect_to_fire.dart';
import 'package:first_app/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DetailsController extends GetxController {
  Rx<File> dpImage = File("").obs;
  RxBool isLoading = false.obs;
  String? url;
  ConnectToFire connectToFire = ConnectToFire();
  TextEditingController textController = TextEditingController();

  void save() async {
    isLoading.value = true;
    if (textController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Enter your name please");
      isLoading.value = false;

      return;
    }
    try {
      if (dpImage.value.path.isNotEmpty) {
        url = await connectToFire.uploadPic(dpImage.value, textController.text);
      }
      await connectToFire.saveData(url, textController.text);
    } catch (e) {
      isLoading.value = false;
    }
    Get.to(() => const HomeScreen());
    isLoading.value = false;
  }

  Future pickPicture(ImageSource source, BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imagePath = File(image.path);
      dpImage.value = imagePath;
    } on PlatformException {
      Fluttertoast.showToast(msg: "Something went Wrong");
    }
  }
}
