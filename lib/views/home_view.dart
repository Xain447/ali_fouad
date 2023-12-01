
import 'package:ali_fouad_app/controllers/delete_user_controller.dart';
import 'package:ali_fouad_app/controllers/home_controller.dart';
import 'package:ali_fouad_app/routes/pages.dart';
import 'package:ali_fouad_app/src/helper/helper.dart';
import 'package:ali_fouad_app/src/helper/text_helper.dart';
import 'package:ali_fouad_app/src/utils/color_manager.dart';
import 'package:ali_fouad_app/src/utils/string_manager.dart';
import 'package:ali_fouad_app/src/utils/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/button_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());
  final DeleteUserController deleteController = Get.put(DeleteUserController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        title: boldTextStyle(text: StringManager.home, fontSize: ValueManager.vm22, color: ColorManager.whiteColor),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: Column(
          children: [
            buildSpaceVertical(height * 0.02),
            Obx(() {
              return controller.user.value != null ?
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  infoCard(controller.user.value!.name!, width, Icons.person_2_rounded),
                  buildSpaceVertical(height * 0.015),
                  infoCard('${controller.user.value!.countryCode!}${controller.user.value!.phone!}', width, Icons.phone_android_rounded),
                  buildSpaceVertical(height * 0.015),
                  infoCard(controller.user.value!.email!, width, Icons.email_outlined),
                ],
              ) : Container();
            }),
            buildSpaceVertical(height * 0.05),
            ButtonWidget(
              height: height * 0.074,
              width: width,
              radius: ValueManager.vm10,
              color: ColorManager.whiteColor,
              textColor: ColorManager.primaryColor,
              elevation: ValueManager.vm1,
              isCard: true,
              title: StringManager.updateInfo,
              onTap: (){ Get.toNamed(Pages.update); },
            ),
            buildSpaceVertical(height * 0.01),
            ButtonWidget(
              height: height * 0.074,
              width: width,
              radius: ValueManager.vm10,
              color: ColorManager.whiteColor,
              textColor: ColorManager.primaryColor,
              elevation: ValueManager.vm1,
              isCard: true,
              title: StringManager.changePass,
              onTap: (){ Get.toNamed(Pages.changePass); },
            ),
            buildSpaceVertical(height * 0.01),
            Obx((){
              return deleteController.isLoading.isTrue ? loader() :
              ButtonWidget(
                height: height * 0.074,
                width: width,
                radius: ValueManager.vm10,
                color: ColorManager.whiteColor,
                textColor: ColorManager.primaryColor,
                elevation: ValueManager.vm1,
                isCard: true,
                title: StringManager.deleteAccount,
                onTap: (){ deleteController.deleteUser(); },
              );
            }),
            buildSpaceVertical(height * 0.01),
            ButtonWidget(
              height: height * 0.074,
              width: width,
              radius: ValueManager.vm10,
              color: ColorManager.whiteColor,
              textColor: ColorManager.primaryColor,
              elevation: ValueManager.vm1,
              isCard: true,
              title: StringManager.logout,
              onTap: (){ controller.logoutUser(); },
            ),
          ],
        ),
      ),
    );
  }

  infoCard(String title, double width, IconData icon){
    return Row(
      children: [
        Icon(icon, color: ColorManager.primaryColor),
        buildSpaceHorizontal(width * 0.05),
        boldTextStyle(text: title, fontSize: ValueManager.vm20, color: ColorManager.darkGreyColor),
      ],
    );
  }
}
