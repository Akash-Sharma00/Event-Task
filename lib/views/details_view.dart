import 'package:first_app/constants/constant.dart';
import 'package:first_app/controllers/details_controller.dart';
import 'package:first_app/widgets/myelevated_button.dart';
import 'package:first_app/widgets/mytextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallate.eaf2fa,
      appBar: AppBar(
        title: const Text("Zaplogics"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(() => controller.dpImage.value.path.isEmpty
                ? GestureDetector(
                    onTap: () {
                      controller.pickPicture(ImageSource.gallery, context);
                    },
                    child: Image.asset(AssetConst.defaultDp))
                : GestureDetector(
                    onTap: () {
                      controller.pickPicture(ImageSource.gallery, context);
                    },
                    child: CircleAvatar(
                        backgroundColor: Pallate.white,
                        radius: 80.r,
                        backgroundImage: FileImage(controller.dpImage.value)),
                  )),
            MyTextField(
              controller: controller.textController,
              label: 'Name',
            ),
            Obx(
              () => MyElevatedButton(
                loading: controller.isLoading.value,
                title: "Save",
                onPressed: controller.save,
              ),
            )
          ],
        ),
      ),
    );
  }
}
