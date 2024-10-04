import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:make_qr/core/extentions/media_query_extention.dart';

import '../../../../core/constants/translation.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font_styles.dart';

class ImageWithGreyContainer extends StatelessWidget {
  final String imagePath;
  final void Function()? onTap;
  const ImageWithGreyContainer({
    super.key,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 60.w,
        height: 60.w,
        decoration: BoxDecoration(
          color: appLightGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 30.w,
                height: 30.w,
              ),
              const SizedBox(height: 10),
              Text(
                Translation.selectAnImage.tr(),
                style: textStyle14Bold.copyWith(color: appGrey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
