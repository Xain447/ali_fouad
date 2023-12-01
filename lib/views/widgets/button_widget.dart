

import 'package:ali_fouad_app/src/helper/text_helper.dart';
import 'package:ali_fouad_app/src/utils/color_manager.dart';
import 'package:ali_fouad_app/src/utils/value_manager.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final double height, width, radius, elevation;
  final Color color;
  final Color textColor;
  final String title;
  final VoidCallback onTap;
  final bool isCard, isSmall;

  const ButtonWidget({Key? key, required this.height, required this.width, required this.radius,
    required this.color, required this.textColor, required this.title, required this.onTap, required this.elevation,
    required this.isCard, this.isSmall = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: isCard == true ?
      SizedBox(
        height: height,
        width: width,
        child: Card(
          elevation: elevation,
          color: color,
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(radius),
              side: const BorderSide(color: ColorManager.primaryColor, width: 0.06)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                boldTextStyle(text: title, fontSize: ValueManager.vm20, color: textColor),
                const Icon(Icons.arrow_forward_ios_rounded, size: ValueManager.vm28),
              ],
            ),
          ),
        ),
      )
          :
      SizedBox(
        height: height,
        width: width,
        child: Card(
          elevation: elevation,
          color: color,
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(radius),
              side: const BorderSide(color: ColorManager.primaryColor, width: 1.0)
          ),
          child: Center(
              child: isSmall == true ?
              boldTextStyle(text: title, fontSize: ValueManager.vm16, color: textColor) :
              boldTextStyle(text: title, fontSize: ValueManager.vm25, color: textColor),
          ),
        ),
      ),

    );
  }
}
