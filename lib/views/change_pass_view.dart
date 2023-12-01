
import 'package:ali_fouad_app/controllers/change_pass_controller.dart';
import 'package:ali_fouad_app/src/helper/helper.dart';
import 'package:ali_fouad_app/src/helper/text_helper.dart';
import 'package:ali_fouad_app/src/utils/color_manager.dart';
import 'package:ali_fouad_app/src/utils/string_manager.dart';
import 'package:ali_fouad_app/src/utils/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/button_widget.dart';
import 'widgets/text_field.dart';

class ChangePassView extends StatelessWidget {
  ChangePassView({super.key});

  final ChangePassController controller = Get.put(ChangePassController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        title: boldTextStyle(text: StringManager.changePass, fontSize: ValueManager.vm22, color: ColorManager.whiteColor),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Padding(
            padding: EdgeInsets.all(width * 0.03),
            child: Column(
              children: [
                buildSpaceVertical(height * 0.07),
                SizedBox(
                  width: width * 0.8,
                  child: CustomTextField(
                    controller: controller.passwordController,
                    hintName: StringManager.currentPass,
                    labelTxt: StringManager.currentPass,
                    fontSize: ValueManager.vm14,
                    color: ColorManager.whiteColor,
                    isPass: true,
                    passwordVisibility: controller.passVisibility,
                  ),
                ),
                buildSpaceVertical(height * 0.01),
                SizedBox(
                  width: width * 0.8,
                  child: CustomTextField(
                    controller: controller.newPasswordController,
                    hintName: StringManager.pass,
                    labelTxt: StringManager.pass,
                    fontSize: ValueManager.vm14,
                    color: ColorManager.whiteColor,
                    isPass: true,
                    passwordVisibility: controller.newPassVisibility,
                  ),
                ),
                buildSpaceVertical(height * 0.01),
                SizedBox(
                  width: width * 0.8,
                  child: CustomTextField(
                    controller: controller.confirmPasswordController,
                    hintName: StringManager.confirmPass,
                    labelTxt: StringManager.confirmPass,
                    fontSize: ValueManager.vm14,
                    color: ColorManager.whiteColor,
                    isPass: true,
                    passwordVisibility: controller.confirmPassVisibility,
                  ),
                ),
                buildSpaceVertical(height * 0.03),
                Obx((){
                  return controller.isLoading.isTrue ? loader() :
                  Center(
                    child: ButtonWidget(
                      height: height * 0.074,
                      width: width * 0.8,
                      radius: ValueManager.vm10,
                      color: ColorManager.primaryColor,
                      textColor: ColorManager.whiteColor,
                      elevation: ValueManager.vm1,
                      isCard: false,
                      title: StringManager.update,
                      onTap: (){ controller.updatePassword(); },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
