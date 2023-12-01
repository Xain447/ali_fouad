
import 'package:ali_fouad_app/routes/pages.dart';
import 'package:ali_fouad_app/src/helper/helper.dart';
import 'package:ali_fouad_app/src/helper/text_helper.dart';
import 'package:ali_fouad_app/src/utils/asset_manager.dart';
import 'package:ali_fouad_app/src/utils/color_manager.dart';
import 'package:ali_fouad_app/src/utils/string_manager.dart';
import 'package:ali_fouad_app/src/utils/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/bottom_text.dart';
import 'widgets/button_widget.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: Padding(
        padding: EdgeInsets.all(width * 0.03),
        child: Column(
          children: [
            buildSpaceVertical(height * 0.07),
            Center(child: Image.asset(AssetManager.logo, scale: 2.8,)),
            buildSpaceVertical(height * 0.03),
            Center(child: boldTextStyle(text: StringManager.welcome, fontSize: ValueManager.vm25, color: ColorManager.primaryColor)),
            buildSpaceVertical(height * 0.22),
            Center(
              child: ButtonWidget(
                height: height * 0.074,
                width: width * 0.7,
                radius: ValueManager.vm10,
                color: ColorManager.primaryColor,
                textColor: ColorManager.whiteColor,
                elevation: ValueManager.vm1,
                isCard: false,
                title: StringManager.login,
                onTap: (){ Get.toNamed(Pages.login); },
              ),
            ),
            buildSpaceVertical(height * 0.015),
            Center(
              child: ButtonWidget(
                height: height * 0.074,
                width: width * 0.7,
                radius: ValueManager.vm10,
                color: ColorManager.whiteColor,
                textColor: ColorManager.primaryColor,
                elevation: ValueManager.vm1,
                isCard: false,
                title: StringManager.register,
                onTap: (){ Get.toNamed(Pages.register); },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: MediaQuery.of(context).viewInsets.bottom == 0.0 ?
      Padding(
          padding: EdgeInsets.only(bottom: width * 0.03),
          child: const BottomText(firstTxt: StringManager.footerTxt, secondTxt: 'Zain Ullah')
      ) : null,
    );
  }
}
