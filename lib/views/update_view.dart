
import 'package:ali_fouad_app/controllers/update_user_controller.dart';
import 'package:ali_fouad_app/src/helper/helper.dart';
import 'package:ali_fouad_app/src/helper/text_helper.dart';
import 'package:ali_fouad_app/src/utils/color_manager.dart';
import 'package:ali_fouad_app/src/utils/string_manager.dart';
import 'package:ali_fouad_app/src/utils/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/button_widget.dart';
import 'widgets/text_field.dart';

class UpdateInfoView extends StatelessWidget {
  UpdateInfoView({super.key});

  final UpdateUserController controller = Get.put(UpdateUserController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        title: boldTextStyle(text: StringManager.updateInfo, fontSize: ValueManager.vm22, color: ColorManager.whiteColor),
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
                    controller: controller.nameController,
                    hintName: StringManager.name,
                    inputType: TextInputType.text,
                    labelTxt: StringManager.name,
                    fontSize: ValueManager.vm14,
                    color: ColorManager.whiteColor,
                  ),
                ),
                buildSpaceVertical(height * 0.01),
                SizedBox(
                  width: width * 0.8,
                  child: CustomTextField(
                    controller: controller.phoneController,
                    hintName: StringManager.phoneNo,
                    inputType: TextInputType.text,
                    labelTxt: StringManager.phoneNo,
                    fontSize: ValueManager.vm14,
                    color: ColorManager.whiteColor,
                    prefixShow: true,
                    onChangedCode: (countryCode){ controller.countryCode = countryCode.dialCode!; },
                  ),
                ),
                buildSpaceVertical(height * 0.01),
                SizedBox(
                  width: width * 0.8,
                  child: CustomTextField(
                    controller: controller.emailController,
                    hintName: StringManager.email,
                    inputType: TextInputType.emailAddress,
                    labelTxt: StringManager.email,
                    fontSize: ValueManager.vm14,
                    color: ColorManager.whiteColor,
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
                      title: StringManager.save,
                      onTap: (){ controller.updateUser(); },
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
